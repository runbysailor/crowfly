class UsersController < ApplicationController
  before_filter :authorize, :except => [:account]
  before_filter :authenticate_user!, :only => [:account]
  before_filter :get_scope, :only => [:account]
  before_filter :match_scope, :only => [:account]
  
  def account    
    @viewers = @user.viewers
    @overlays = @user.overlays
    @geofiles = @user.geofiles    
  end  

  def index
    @users = User.all
    render :layout => 'devise'
  end
  
  def show
    @user = User.find(params[:id])
    render :layout => 'devise'
  end
end