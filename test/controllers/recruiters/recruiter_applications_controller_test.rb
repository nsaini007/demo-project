require "test_helper"

class Recruiters::RecruiterApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruiters_recruiter_applications_index_url
    assert_response :success
  end
end
