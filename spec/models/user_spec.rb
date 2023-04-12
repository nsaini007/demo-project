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

    context "before_create" do
      it "should add default cover if none is attached" do
        expect(user1.profile_picture).to be_attached
      end
    end

    context "after_create" do

      # it {debugger}
      it "should create applicant profile for applicants" do
        # user = create(:user)
        # applicant_profile = create(:applicant_profile, applicant_id: user)
        expect { user1 }.to change { ApplicantProfile.count }.by(1)
      end
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }

    it "should only allow valid types" do
      user = User.new(type: "", first_name: "John", last_name: "Doe")
      # user.errors.full_messages.should include("Not a valid type")
      expect(user).not_to be_valid
    end

    it 'validates that age is above given age limit' do
      user1.type = 'invalidType'
      user1.validate
      user1.save
      expect(user1.errors[:type]).to include('Not a valid type') 
    end

    it "should allow valid types" do
      # user = User.new(type: "Applicant", first_name: "John", last_name: "Doe")
      expect(user1).to be_valid
    end
  end
end

RSpec.describe Applicant, type: :model do
  describe 'associations' do
    it { should have_one(:applicant_profile).class_name('ApplicantProfile').with_foreign_key('applicant_id') }
    it { should have_many(:applications).class_name('Application').with_foreign_key('applicant_id') }
  end
end

RSpec.describe Recruiter, type: :model do
  describe "associations" do
    it { should have_many(:jobs).with_foreign_key('recruiter_id') }
    it { should have_one(:recruiter_profile).with_foreign_key('recruiter_id') }
  end
end
