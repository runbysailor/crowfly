class GeofilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]
  
  def index
    @geofiles = @user.geofiles
  end

  def show
    @geofile = @user.geofiles.find(params[:id])
  end

  def new
    @viewers = @user.viewers
    @geofile = @user.geofiles.build(params[:geofile])  
  end

  def edit
    @viewers = @user.viewers
    @geofile = @user.geofiles.find(params[:id])  
  end

  def create
    @viewers = @user.viewers
    @geofile = @user.geofiles.build(params[:geofile])
    
    if @geofile.save
      redirect_to(user_geofiles_path, :notice => 'GeoFile successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @viewers = @user.viewers
    @geofile = @user.geofiles.find(params[:id])
    
    if @geofile.update_attributes(params[:geofile])
      redirect_to(user_geofiles_path, :notice => 'GeoFile successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @geofile = @user.geofiles.find(params[:id])
    @geofile.destroy
    redirect_to(user_geofiles_path, :notice => 'GeoFile successfully removed.')
  end
end