require 'rails_helper'
RSpec.describe Applicants::ApplicantProfileController, type: :controller do
    let(:applicant) { create(:applicant) }
    let(:applicant_profile) { create(:applicant_profile) }
  
    before do
      applicant.confirm
      sign_in applicant
    end
    describe "#show" do
      # it { debugger }
      it "renders the show template" do
        # controller.stub(:current_user).and_return(applicant)
        get :show, params: {id: applicant_profile.id}
        expect(response).to render_template(:show)
      end

      it "assigns the applicant profile to @profile" do
        # get :show, params: {id: applicant_profile}
        expect(assigns(:profile)).to eq(@profile)
      end
    end
    
    describe "#edit" do    
      it "assigns the applicant profile to @profile" do
        # get :edit, params: {id: applicant_profile.id}
        expect(assigns(:profile)).to eq(@profile)
      end
    end

end