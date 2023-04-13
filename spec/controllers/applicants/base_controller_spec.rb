require 'rails_helper'
RSpec.describe Applicants::BaseController do
  controller do
    def index
      render plain: "hello world"
      
    end
  end

  let(:applicant) { create(:applicant) }
  before do
    applicant.confirm
    sign_in(applicant)
  end
  describe "before_actions" do
    # it {debugger}
      it "authenticates the user" do
        controller.stub(:current_user).and_return(applicant)
        expect(controller).to receive(:authenticate_user!)
      end
  
      # it "requires the user to be an applicant" do
      #   expect(controller).to receive(:applicant?)
      # end
  end
  
    describe "layout" do
      it "sets the layout to 'applicant'" do
        expect(controller.layout).to receive(:layout).with('applicant')
      end
    end
end
