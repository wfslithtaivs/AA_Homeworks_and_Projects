require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get subs_show_url
    assert_response :success
  end

end
