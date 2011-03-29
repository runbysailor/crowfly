class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_viewer
    @viewer = Viewer.find(params[:viewer_id])
  end
  
  def get_beginning
    @beginning = @viewer.beginning
  end
  
  def get_scope
    @user = User.find_by_company_name(params[:company_name])
  end
  
  def match_scope
    unless current_user.id==@user.id || current_user.id==1
      redirect_to user_account_path(current_user), :notice => "You can only access your own account."
    end
  end
  
  def maps
    @viewer = Viewer.find(1)
    @beginning = @viewer.beginning
    @destinations = @viewer.destinations    
    @points = @viewer.points
    @overlay = @viewer.overlays.last
    @geofile = @viewer.geofiles.first
    render :layout => 'application'
  end
  
  def about
    render :layout => 'public'
  end
  
  def contact
    render :layout => 'public'
  end
  
  def terms
    render :layout => 'public'
  end
  
  protected
  
  def authorize
    if user_signed_in?
      if current_user.id==1
      else        redirect_to new_user_session_path, :notice => "You do not have permission to administer users."      end
    else
      redirect_to new_user_session_path, :notice => "You must be signed in to administer users."
    end
  end
end