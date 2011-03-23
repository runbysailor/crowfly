class BeginningsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]
  before_filter :get_viewer
  before_filter :get_beginning
  
  def edit        
  end

  def update    
    if @beginning.update_attributes(params[:beginning])
      @meters = @beginning.altitude.to_i/3.2808399
      @beginning.altitude = @meters.to_s
      @beginning.save
      redirect_to(user_viewer_path, :notice => 'Beginning successfully updated.')        
    else
      @beginning.reload
      render :action => "edit"
    end
  end
end