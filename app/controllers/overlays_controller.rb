class OverlaysController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]
  
  def index
    @overlays = @user.overlays.all(:order => "position")
  end
  
  def sort
    params[:overlay].each_with_index do |id, index|
      @user.overlays.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true    
  end

  def new
    @viewers = @user.viewers
    @overlay = @user.overlays.build(params[:overlay])
  end

  def edit
    @viewers = @user.viewers
    @overlay = @user.overlays.find(params[:id]) 
  end

  def create
    @viewers = @user.viewers
    @overlay = @user.overlays.build(params[:overlay])
  
    if @overlay.save
      redirect_to(user_overlays_path, :notice => @overlay.name + ' was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @viewers = @user.viewers
    @overlay = @user.overlays.find(params[:id]) 
    
    if @overlay.update_attributes(params[:overlay])
      redirect_to(user_overlays_path, :notice => @overlay.name + ' was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @overlay = @user.overlays.find(params[:id]) 
    @overlay.destroy
    redirect_to(user_overlays_path, :notice => 'Successfully removed.')
  end
end