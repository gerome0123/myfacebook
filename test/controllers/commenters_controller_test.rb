require 'test_helper'

class CommentersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commenters_create_url
    assert_response :success
  end

end
