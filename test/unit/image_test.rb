require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    @image = Image.new
  end
  
  test 'should have attached file called image' do
    assert @image.respond_to? :image
    assert_equal Paperclip::Attachment, @image.send(:image).class
  end
  
  test 'should not save image with nothing' do
    assert !@image.save
  end
  
  test 'an image should be able to belong to a car' do
    assert @image.respond_to?(:car)
  end
end
