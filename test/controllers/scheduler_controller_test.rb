require "test_helper"

class SchedulerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scheduler_index_url
    assert_response :success
  end
end
