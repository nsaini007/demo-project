require 'rails_helper'
RSpec. describe User, type: :model do
  let(:user) { build :user }
  let(:user1) { create :applicant }

  context 'when creating a user' do

    it 'should be valid user with all attributes' do
      expect(user.valid?).to eq(true)
    end
  end



  describe "callbacks" do

    
    context "after_create" do

      # it {debugger}
      it "should create applicant profile for applicants" do
        # user = create(:user)
        # applicant_profile = create(:applicant_profile, applicant_id: user)
        expect { user1.create }.to change { ApplicantProfile.count }.by(1)
      end
    end
  end
end
