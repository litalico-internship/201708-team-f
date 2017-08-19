require 'test_helper'

class EvalControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get eval_new_url
    assert_response :success
  end

end
