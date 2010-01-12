require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
    assert_select 'ul#cars>li', 2 do
      assert_select 'a>img[src=?]', /.*?thumb.*?image_1.jpg$/
      assert_select 'a>img[src=?]', /.*?thumb.*?image_11.jpg$/
    end
  end
  
  test 'should get show' do
    get :show, {:id => cars(:maserati)}
    assert_response :redirect
    assert_redirected_to car_images_path(assigns(:car))
  end
  
  test 'should delete a car' do
    assert_difference('Car.count', -1) do
      delete :destroy, {:id => cars(:maserati)}
    end
    
    assert_response :redirect
    assert_redirected_to cars_path
    assert_equal '2004 Maserati MC12 has been removed from your lot.', flash[:notice]
  end
  
  test 'should create a car' do
    assert_difference('Car.count') do
      post :create, :car => {:title => '1992 Chevrolet Corsica'}
    end
    
    assert_response :redirect
    assert_redirected_to car_path(assigns(:car))
    assert_equal '1992 Chevrolet Corsica has been added to your lot.', flash[:notice]
  end
  
  test 'should get new' do
    get :new
    assert_response :success
    assert_not_nil assigns(:car)
    form_assertions 'new'
  end
  
  test 'should not create car and redisplay new car form' do
    assert_no_difference('Car.count') do
      post :create, :car => {:title => ''}
    end
    assert_template :new
    form_errors_assertions
  end
  
  test 'should get edit' do
    get :edit, {:id => cars(:maserati)}
    assert_response :success
    assert_not_nil assigns(:car)
    form_assertions 'edit'
  end
  
  test 'should update car title and redirect to show update' do
    put :update, {:id => cars(:maserati), :car => {:title => 'new title'}}
    assert_response :redirect
    assert_redirected_to car_path(cars(:maserati))
    assert_equal 'This car was successfully updated.', flash[:notice]
  end
  
  test 'should update car description and redirect to show update' do
    put :update, {:id => cars(:maserati), :car => {:description => 'new description'}}
    assert_response :redirect
    assert_redirected_to car_path(cars(:maserati))
    assert_equal 'This car was successfully updated.', flash[:notice]
  end
  
  test 'should not update car with a blank title and redisplay edit form' do
    put :update, {:id => cars(:maserati), :car => {:title => ''}}
    assert_response :success
    assert_not_nil assigns(:car)
    assert_template :edit
    form_errors_assertions
  end
  
  def form_assertions(action)
    assert_select "form[id=?]", /#{action}_car(_\d+)?/ do
      assert_select 'label[for=car_title]'
      assert_select 'label[for=car_description]'
      assert_select 'input' do
        assert_select '[id=car_title]'
        assert_select '[type=submit][id=car_submit]'
      end
      assert_select 'textarea[id=car_description]'
      case action
      when 'new'
        assert_select 'input[value=Add this car]'
      when 'edit'
        assert_select 'input[value=Update this car]'
      end
    end
  end
  
  def form_errors_assertions
    assert_select 'div[class=form_validation_errors]' do
      assert_select 'h2', :text => 'Uh-oh something is wrong...'
      assert_select 'h3', :text => /\d+ errors? must be corrected to put this car on your lot\./
      assert_select 'ul' do
        assert_select 'li'
      end
    end
  end
end
