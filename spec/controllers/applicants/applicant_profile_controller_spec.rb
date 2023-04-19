require 'rails_helper'
RSpec.describe Applicants::ApplicantProfileController, type: :controller do
    let(:applicant) { create(:applicant) }
  
    before do
      applicant.confirm
      sign_in applicant
    end
    describe "#show" do
      # it { debugger }
      it "renders the show template" do
        debugger
        get :show, params: {id: applicant.applicant_profile.id}
        expect(response).to render_template(:show)
      end
      
      it "assigns the applicant profile to @profile" do
        get :show, params: {id: applicant.applicant_profile.id}
        expect(assigns(:profile)).to eq(applicant.applicant_profile)
      end
    end
    
    describe "#edit" do    
      it "assigns the applicant profile to @profile" do
        # debugger
        patch :update, params: {id: applicant.applicant_profile.id,   applicant_profile: {skills: ['Python']} }
        expect(assigns[:profile].skills).to eq(['Python'])
      end
    end

end