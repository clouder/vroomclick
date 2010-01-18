class ImagesController < ApplicationController
  before_filter :load_car
  
  def index
    @image = @car.images.first :order => 'id ASC'
    @image_url = @image ? @image.image.url : '/images/no-car-image-original.jpg'
  end
  
  def show
    @image = @car.images.find(params[:id])
    render :index
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = @car.images.build(params[:image])
    if @image.save
      flash[:notice] = 'Image was successfully added.'
      redirect_to [@car, @image]
    else
      render :new
    end
  end
  
  private
  
  def load_car
    @car = Car.find(params[:car_id])
  end
end
