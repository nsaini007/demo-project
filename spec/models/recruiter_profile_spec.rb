require 'rails_helper'

RSpec.describe RecruiterProfile, type: :model do
  let(:recruiter_profile) { create :recruiter_profile }

  context 'when creating a recruiter_profile' do

    it 'should be valid recruiter_profile with all attributes' do
      expect(recruiter_profile.valid?).to eq(true)
    end
  end

  describe "associations" do
    it { should belong_to(:recruiter).class_name('Recruiter') }
    it { should belong_to(:company) }
  end
end
