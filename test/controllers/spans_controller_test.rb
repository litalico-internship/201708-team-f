require 'test_helper'

class SpansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @span = spans(:one)
  end

  test "should get index" do
    get spans_url
    assert_response :success
  end

  test "should get new" do
    get new_span_url
    assert_response :success
  end

  test "should create span" do
    assert_difference('Span.count') do
      post spans_url, params: { span: { name: @span.name } }
    end

    assert_redirected_to span_url(Span.last)
  end

  test "should show span" do
    get span_url(@span)
    assert_response :success
  end

  test "should get edit" do
    get edit_span_url(@span)
    assert_response :success
  end

  test "should update span" do
    patch span_url(@span), params: { span: { name: @span.name } }
    assert_redirected_to span_url(@span)
  end

  test "should destroy span" do
    assert_difference('Span.count', -1) do
      delete span_url(@span)
    end

    assert_redirected_to spans_url
  end
end
