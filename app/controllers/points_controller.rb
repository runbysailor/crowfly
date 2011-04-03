class PointsController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]
  before_filter :get_viewer
  before_filter :get_beginning
  
  def index
    @points = @viewer.points    
  end
    
  def new    
    @point = @viewer.points.build(params[:point])    
  end
  
  def edit
    @point = @viewer.points.find(params[:id])
  end

  def create
    @point = @viewer.points.build(params[:point])

    if @point.save
      redirect_to(user_viewer_points_path, :notice => 'Point successfully created.')
    else      
      render :action => "new"
    end      
  end

  def update
    @point = @viewer.points.find(params[:id])

    if @point.update_attributes(params[:point])
      redirect_to(user_viewer_points_path, :notice => 'Point successfully updated.')
    else
      @destinations = @viewer.destinations
      render :action => "edit"
    end
  end

  def destroy
    @point = @viewer.points.find(params[:id])
    @point.destroy
    redirect_to(user_viewer_points_path, :notice => 'Successfully removed.')
  end
end