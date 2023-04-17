require 'rails_helper'
RSpec.describe Applicants::BaseController do

  let(:applicant) { create(:applicant) }
  before do
    applicant.confirm
    sign_in(applicant)
  end
  
  describe "layout" do
    it "sets the layout to 'applicant'" do
      expect(controller).to render_template(layout: nil)
    end
  end
end
