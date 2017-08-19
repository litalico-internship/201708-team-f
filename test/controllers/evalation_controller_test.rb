require 'test_helper'

class EvalationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get evalation_new_url
    assert_response :success
  end

end
