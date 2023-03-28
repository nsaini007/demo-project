require "test_helper"

class Applicants::ApplicantProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applicants_applicant_profile_index_url
    assert_response :success
  end
end
