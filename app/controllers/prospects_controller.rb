class ProspectsController < ApplicationController
  before_filter :authorize, :except => [:show, :new, :create]
  
  def convert
    @prospect = Prospect.find(params[:id])
    @user = User.invite!(:email => @prospect.email)
    @prospect.update_attributes(:invited => true)    
    redirect_to prospects_path, :notice => "Invitation sent successfully."    
  end
  
  def index
    @prospects = Prospect.all
    render :layout => "devise"
  end

  def show    
    render :layout => "devise"
  end

  def new
    @prospect = Prospect.new
    render :layout => "prospect"
  end

  def edit
    @prospect = Prospect.find(params[:id])
  end

  def create
    @prospect = Prospect.new(params[:prospect])    
    if @prospect.save
      redirect_to welcome_path, :layout => "devise"
    else
      render :action => "new", :layout => "prospect"
    end
  end

  def update
    @prospect = Prospect.find(params[:id])    
    if @prospect.update_attributes(params[:prospect])
      redirect_to(@prospect, :notice => 'Prospect was successfully updated.')
    else
      render :action => "edit"
    end      
  end

  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy
    redirect_to(prospects_url)
  end
end