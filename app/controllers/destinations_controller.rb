class DestinationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_scope
  before_filter :match_scope, :except => [:present]
  before_filter :get_viewer
  before_filter :get_beginning
  
  def index    
    @destinations = @viewer.destinations.all(:order => "position")
  end
  
  def sort
    params[:destination].each_with_index do |id, index|
      @viewer.destinations.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true    
  end

  def new    
    @destination = @viewer.destinations.build(params[:destination])
  end

  def edit    
    @destination = @viewer.destinations.find(params[:id])
  end

  def create    
    @destination = @viewer.destinations.build(params[:destination])
    
    if @destination.save
      @meters = @destination.altitude.to_i/3.2808399
      @destination.altitude = @meters.to_s
      @destination.save
      redirect_to(user_viewer_destinations_path, :notice => 'Destination successfully created.')
    else
      render :action => "new"
    end
  end

  def update    
    @destination = @viewer.destinations.find(params[:id])
    
    if @destination.update_attributes(params[:destination])
      @meters = @destination.altitude.to_i/3.2808399
      @destination.altitude = @meters.to_s
      @destination.save
      redirect_to(user_viewer_destinations_path, :notice => 'Destination successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy    
    @destination = @viewer.destinations.find(params[:id])
    @destination.destroy
    redirect_to(user_viewer_destinations_path, :notice => 'Destination successfully removed.')
  end
end