require 'test_helper'

class CarTest < ActiveSupport::TestCase
  def setup
    @car = Car.new(:title => '1992 Chevrolet Corsica', :description => 'A short description')
  end
  
  test "should save a valid car" do
    assert @car.save
  end
  
  test "should not save a car without a title" do
    @car.title = ''
    assert !@car.save
  end
  
  test 'a car should be able to have many images' do
    assert @car.respond_to?(:images)
  end
  
  test 'should remove related images when a car is removed' do
    car = cars(:bugatti)
    assert_difference 'Image.count', -5 do
      car.destroy
    end
  end
end
