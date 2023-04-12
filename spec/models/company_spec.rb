require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { create :company }

  context 'when creating a company' do

    it 'should be valid company with all attributes' do
      expect(company.valid?).to eq(true)
    end
  end

  describe "associations" do
    it { should have_one(:recruiter_profile) }
  end
end
