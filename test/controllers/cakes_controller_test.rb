require 'test_helper'

class CakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cakes_index_url
    assert_response :success
  end

  test "should get show" do
    get cakes_show_url
    assert_response :success
  end

  test "should get new" do
    get cakes_new_url
    assert_response :success
  end

  test "should get create" do
    get cakes_create_url
    assert_response :success
  end

  test "should get edit" do
    get cakes_edit_url
    assert_response :success
  end

  test "should get update" do
    get cakes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cakes_destroy_url
    assert_response :success
  end

end
