class ApplicationsController < ApplicationController
    
  def show
    @app=Application.find(params[:id])
  end

  
  
  
  def new 
  end

  def create
    application = Application.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      description: params[:description],
      status: "In Progress"
    })
    if application.save && no_missing_params
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/new"
      flash.alert = "Each field must be complete"
    end
  end


  private 
  def id
    params[:id]
  end

  def no_missing_params 
    params.values.all? {|p| !p.empty?}
  end
end