class Users::ConfirmationsController < Devise::ConfirmationsController
  include Devise::Controllers::InternalHelpers
  layout 'devise'

  def new
    build_resource({})
    render_with_scope :new
  end

  def create
    self.resource = resource_class.send_confirmation_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions
      redirect_to new_session_path(resource_name)
    else
      render_with_scope :new
    end
  end
  
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message :notice, :confirmed
      sign_in(resource_name, resource) # do not redirect after sign in
      redirect_to(user_account_path(resource)) # redirect to account map
    else
      render_with_scope :new
    end
  end
end