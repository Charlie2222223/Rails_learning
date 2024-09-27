# test/controllers/departments_controller_test.rb
require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department = departments(:one) 
  end

  test "should get index" do
    get departments_url
    assert_response :success
    assert_not_nil assigns(:departments) 
  end

  test "should show department" do
    get department_url(@department)
    assert_response :success
    assert_equal @department.as_json, JSON.parse(@response.body) 
  end
  
end
