class ViewersController < ApplicationController  
  before_filter :authenticate_user!, :except => [:present]
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]

  def index
    @viewers = @user.viewers
  end
  
  def present
    @viewer = @user.viewers.find_by_link(params[:link])
    if @viewer.nil?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @overlays = @viewer.overlays
      @geofiles = @viewer.geofiles
      @beginning = @viewer.beginning
      @destinations = @viewer.destinations
      @points = @viewer.points
    end
  end

  def show
    @viewer = @user.viewers.find(params[:id])
    @overlays = @viewer.overlays
    @geofiles = @viewer.geofiles
    @beginning = @viewer.beginning
    @destinations = @viewer.destinations
    @points = @viewer.points
  end

  def new
    @viewer = @user.viewers.build(params[:viewer])
  end

  def edit
    @viewer = @user.viewers.find(params[:id])
    @beginning = @viewer.beginning
  end

  def create
    @viewer = @user.viewers.build(params[:viewer])
    if @viewer.save
      Beginning.create [:viewer_id => @viewer.id]
      @beginning = @viewer.beginning
      redirect_to(edit_user_viewer_beginning_path(@user, @viewer, @beginning), :notice => 'Viewer successfully created. Let\'s start by adding the beginning view.')
    else
      render :action => "new"
    end
  end

  def update
    @viewer = @user.viewers.find(params[:id])
    if @viewer.update_attributes(params[:viewer])      
      redirect_to(user_viewer_path(@user, @viewer), :notice => 'Viewer successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @viewer = @user.viewers.find(params[:id])
    @viewer.destroy
    redirect_to(user_viewers_url(@user), :notice => 'Viewer successfully removed.')
  end
end