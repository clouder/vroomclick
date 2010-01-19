class SettingsController < ApplicationController
  before_filter :login_required
  def show
  end
  
  def update 
    Settings.dealership_name = params[:settings][:dealership_name]
    @user = User.find(current_user)
    @user.update_attributes params[:user]
    flash[:notice] = 'Settings were successfully saved.'
    redirect_to settings_url
  end
end
