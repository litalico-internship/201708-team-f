require 'test_helper'

class AdvisersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adviser = advisers(:one)
  end

  test "should get index" do
    get advisers_url
    assert_response :success
  end

  test "should get new" do
    get new_adviser_url
    assert_response :success
  end

  test "should create adviser" do
    assert_difference('Adviser.count') do
      post advisers_url, params: { adviser: { avator: @adviser.avator, comment: @adviser.comment, day: @adviser.day, end_time: @adviser.end_time, max_age: @adviser.max_age, min_age: @adviser.min_age, name: @adviser.name, start_time: @adviser.start_time } }
    end

    assert_redirected_to adviser_url(Adviser.last)
  end

  test "should show adviser" do
    get adviser_url(@adviser)
    assert_response :success
  end

  test "should get edit" do
    get edit_adviser_url(@adviser)
    assert_response :success
  end

  test "should update adviser" do
    patch adviser_url(@adviser), params: { adviser: { avator: @adviser.avator, comment: @adviser.comment, day: @adviser.day, end_time: @adviser.end_time, max_age: @adviser.max_age, min_age: @adviser.min_age, name: @adviser.name, start_time: @adviser.start_time } }
    assert_redirected_to adviser_url(@adviser)
  end

  test "should destroy adviser" do
    assert_difference('Adviser.count', -1) do
      delete adviser_url(@adviser)
    end

    assert_redirected_to advisers_url
  end
end
