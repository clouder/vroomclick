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
  
  test 'should not save image when file is not an image' do
    f = open_file 'file.txt'
    @image.image = f
    assert !@image.save
  end
  
  test 'should save image when file is a jpg' do
    f = open_file 'lambo.jpg'
    @image.image = f
    assert @image.save
  end
  
  def open_file(file_name)
    File.open(File.join(Rails.root, 'test', 'fixtures', 'files', file_name))
  end
end
