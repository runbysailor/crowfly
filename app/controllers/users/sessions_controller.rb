class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers
  layout 'devise'

  def new
    clean_up_passwords(build_resource)
    render_with_scope :new
  end

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "new")
    #resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) #if is_navigational_format?
    sign_in(resource_name, resource)
    #respond_with resource, :location => redirect_location(resource_name, resource)
    redirect_to stored_location_for(:user) || user_account_path(resource)      
  end

  def destroy
    signed_in = signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
    set_flash_message :notice, :signed_out if signed_in
  end
end
