class SettingsController < ApplicationController
  def show
  end
  
  def update 
    Settings.dealership_name = params[:settings][:dealership_name]
    flash[:notice] = 'Settings were successfully saved.'
    render :show
  end
end
