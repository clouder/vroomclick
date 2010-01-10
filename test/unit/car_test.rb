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
end
