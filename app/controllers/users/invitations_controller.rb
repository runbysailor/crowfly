class Users::InvitationsController < Devise::InvitationsController  
  layout 'devise'  

  def update
    self.resource = resource_class.accept_invitation!(params[resource_name])
    if resource.errors.empty?
      @prospect = Prospect.find_by_email(resource.email) # find the corresponding prospect
      unless @prospect.nil?
        @prospect.destroy # remove prospect status
      end
      set_flash_message :notice, :updated
      sign_in(resource_name, resource) # do not redirect after sign in
      redirect_to(user_account_path(resource)) # redirect to account map
    else
      render_with_scope :edit
    end
  end
end