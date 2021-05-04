require 'test_helper'

class DestinationControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get destination_post_url
    assert_response :success
  end

end
