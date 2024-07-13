require "test_helper"

class LawsuitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lawsuits_index_url
    assert_response :success
  end
end
