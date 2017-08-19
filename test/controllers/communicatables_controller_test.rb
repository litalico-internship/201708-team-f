require 'test_helper'

class CommunicatablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @communicatable = communicatables(:one)
  end

  test "should get index" do
    get communicatables_url
    assert_response :success
  end

  test "should get new" do
    get new_communicatable_url
    assert_response :success
  end

  test "should create communicatable" do
    assert_difference('Communicatable.count') do
      post communicatables_url, params: { communicatable: { name: @communicatable.name } }
    end

    assert_redirected_to communicatable_url(Communicatable.last)
  end

  test "should show communicatable" do
    get communicatable_url(@communicatable)
    assert_response :success
  end

  test "should get edit" do
    get edit_communicatable_url(@communicatable)
    assert_response :success
  end

  test "should update communicatable" do
    patch communicatable_url(@communicatable), params: { communicatable: { name: @communicatable.name } }
    assert_redirected_to communicatable_url(@communicatable)
  end

  test "should destroy communicatable" do
    assert_difference('Communicatable.count', -1) do
      delete communicatable_url(@communicatable)
    end

    assert_redirected_to communicatables_url
  end
end
