class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [:cancel]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_filter :authorize, :only => [:new, :create]
  include Devise::Controllers::InternalHelpers
  layout 'devise'
end