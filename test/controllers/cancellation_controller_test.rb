require 'test_helper'

class CancellationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cancellation_new_url
    assert_response :success
  end

end
