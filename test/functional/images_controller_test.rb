require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index, {:car_id => cars(:maserati)}
    assert_response :success
    assert_common_assigns
    assert_thumbnail_list 10
    assert_select 'img#main-image[src$=image_1.jpg]'
  end
  
  test 'should get show for every image of the maserati' do
    assert_show_action_for_every_image_of_car cars(:maserati)
  end
  
  test 'should get show for every image of the bugatti' do
    assert_show_action_for_every_image_of_car cars(:bugatti)
  end
  
  test 'should get new' do
    get :new, {:car_id => cars(:maserati)}
    assert_response :success
    assert_common_assigns
    assert_new_image_form
  end
  
  test 'should add an image to maserati' do
    assert_difference 'Image.count' do
      post :create, {:car_id => cars(:maserati), :image => {:image => fixture_file_upload(File.join('files', 'lambo.jpg'), 'image/jpg', :binary)}}
    end
    assert_response :redirect
    assert_redirected_to car_image_path(assigns(:car), assigns(:image))
    assert_equal 'Image was successfully added.', flash[:notice]
  end
  
  test 'should not add an image to maserati when the file is not an image' do
    assert_no_difference 'Image.count' do
      post :create, {:car_id => cars(:maserati), :image => {:image => fixture_file_upload(File.join('files', 'file.txt'), 'text/plain', :binary)}}
    end
    assert_response :success
    assert_template :new
    assert_new_image_form
    assert_form_errors
  end
  
  def assert_common_assigns
    assert_not_nil assigns(:car), '@car was not assigned'
    assert_not_nil assigns(:image), '@image was not assigned'
  end
  
  def assert_thumbnail_list(item_count)
    assert_select 'ul#thumbnails>li', item_count do |elm|
      elm.each do |elm|
        assert_select elm, 'a>img[src=?]', /.*?thumb.*?image_\d+.jpg/, 1
      end
    end
  end
  
  def assert_show_action_for_every_image_of_car(car)
    car.images.each do |i|
      get :show, {:car_id => car, :id => i}
      assert_response :success
      assert_template :index
      assert_common_assigns
      assert_thumbnail_list car.images.count
      assert_select "img#main-image[src$=image_#{i.id}.jpg]"
    end
  end
  
  def assert_new_image_form
    assert_select 'form#new_image[enctype=multipart/form-data]' do
      assert_select 'label[for=image_image]'
      assert_select 'input' do
        assert_select '#image_image'
        assert_select '#image_submit[type=submit]'
      end
    end
  end
  
  def assert_form_errors
    assert_select 'div[class=form_validation_errors]' do
      assert_select 'h2', :text => 'Uh-oh something is wrong...'
      assert_select 'h3', :text => /\d+ errors? must be corrected/
      assert_select 'ul' do
        assert_select 'li'
      end
    end
  end
end
