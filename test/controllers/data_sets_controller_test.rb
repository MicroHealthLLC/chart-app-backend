require "test_helper"

class DataSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_set = data_sets(:one)
  end

  test "should get index" do
    get data_sets_url, as: :json
    assert_response :success
  end

  test "should create data_set" do
    assert_difference('DataSet.count') do
      post data_sets_url, params: { data_set: { data: @data_set.data, description: @data_set.description, title: @data_set.title } }, as: :json
    end

    assert_response 201
  end

  test "should show data_set" do
    get data_set_url(@data_set), as: :json
    assert_response :success
  end

  test "should update data_set" do
    patch data_set_url(@data_set), params: { data_set: { data: @data_set.data, description: @data_set.description, title: @data_set.title } }, as: :json
    assert_response 200
  end

  test "should destroy data_set" do
    assert_difference('DataSet.count', -1) do
      delete data_set_url(@data_set), as: :json
    end

    assert_response 204
  end
end
