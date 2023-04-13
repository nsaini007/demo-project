require 'rails_helper'

RSpec.describe ApplicantProfile, type: :model do
  let(:applicant_profile) { create :applicant_profile }

  context 'when creating a applicant_profile' do

    it 'should be valid applicant_profile with all attributes' do
      expect(applicant_profile.valid?).to eq(true)
    end
  end

  describe "associations" do
    it { should belong_to(:applicant) }
  end

  describe "before_validation" do
    describe "#check_skills" do
      let(:applicant_profile) { create(:applicant_profile, skills: ["Ruby", nil, "Python", ""]) }
      
      it "removes any nil or blank skills" do
        expect(applicant_profile.skills).to eq(["Ruby", "Python"])
      end
    end
  end
end

