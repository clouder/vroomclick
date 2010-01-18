# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def first_car_image(car, style = :original)
    if car.images.first
      car.images.first.image.url(style)
    else
      "/images/no-car-image-#{style}.jpg"
    end
  end
end
