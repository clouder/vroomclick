require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "should get show and display a form for updating settings" do
    UserSession.create(users(:foo))
    get :show
    assert_response :success
    assert_select 'form#settings' do
      assert_select 'input#settings_dealership_name[type=text][value=Vroomclick]'
      assert_select 'input[type=submit]'
    end
  end
  
  test 'should update settings' do
    UserSession.create(users(:foo))
    put :update, :settings => {:dealership_name => 'SuperAutoMart'}
    assert_response :redirect
    assert_equal 'Settings were successfully saved.', flash[:notice]
  end
  
  test 'should update settings to defaults when blank' do
    UserSession.create(users(:foo))
    put :update, :settings => {:dealership_name => ''}
    assert_response :redirect
  end
end
