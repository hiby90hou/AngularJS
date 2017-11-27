require 'test_helper'

class SataicPagesControllerTest < ActionDispatch::IntegrationTest
 test "the truth" do
 	get '/static_pages/about'
    assert_response :success
  end
end
