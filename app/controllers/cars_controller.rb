class CarsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find params[:id]
    redirect_to car_images_url(@car)
  end
  
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    flash[:notice] = "#{@car.title} has been removed from your lot."
    redirect_to cars_url
  end
  
  def create
    @car = Car.new(params[:car])
    if @car.save
      flash[:notice] = "#{@car.title} has been added to your lot."
      redirect_to @car
    else
      render :new
    end
  end
  
  def new
    @car = Car.new
  end
  
  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update_attributes params[:car]
      flash[:notice] = 'This car was successfully updated.'
      redirect_to @car
    else
      render :edit
    end
  end
end
