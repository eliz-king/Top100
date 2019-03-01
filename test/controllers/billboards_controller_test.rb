require 'test_helper'

class BillboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get billboards_index_url
    assert_response :success
  end

  test "should get edit" do
    get billboards_edit_url
    assert_response :success
  end

  test "should get show" do
    get billboards_show_url
    assert_response :success
  end

  test "should get delete" do
    get billboards_delete_url
    assert_response :success
  end

  test "should get update" do
    get billboards_update_url
    assert_response :success
  end

  test "should get create" do
    get billboards_create_url
    assert_response :success
  end

end
