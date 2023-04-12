require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:application) { create :application }

  context 'when creating a application' do

    it 'should be valid application with all attributes' do
      expect(application.valid?).to eq(true)
    end
  end




  describe 'associations' do
    it { should belong_to(:job) }
    it { should belong_to(:applicant).class_name('User') }
    it { should have_one_attached(:resume) }
  end

  describe 'validations' do
    it { should validate_presence_of(:resume) }
    subject { FactoryBot.create(:job) }
    subject { FactoryBot.create(:application) }
    it { should validate_uniqueness_of(:applicant_id).scoped_to(:job_id) }
  end

  describe 'aasm' do
    let(:application) { create(:application) }

    it 'has an initial state of applied' do
      expect(application).to transition_from(:applied).to(:accepted).on_event(:accept)
      expect(application).to transition_from(:applied).to(:rejected).on_event(:reject)
    end

    it 'transitions to the accepted state when accept event is triggered' do
      expect { application.accept! }.to change { application.status }.from('applied').to('accepted')
    end

    it 'transitions to the rejected state when reject event is triggered' do
      expect { application.reject! }.to change { application.status }.from('applied').to('rejected')
    end
  end

  describe 'scopes' do
    let!(:application1) { create(:application, status: 'applied') }
    let!(:application2) { create(:application, status: 'accepted') }
    let!(:application3) { create(:application, status: 'rejected') }

    describe '.applied' do
      it 'returns all applications with status applied' do
        expect(Application.applied).to match_array([application1])
      end
    end

    describe '.accepted' do
      it 'returns all applications with status accepted' do
        expect(Application.accepted).to match_array([application2])
      end
    end

    describe '.rejected' do
      it 'returns all applications with status rejected' do
        expect(Application.rejected).to match_array([application3])
      end
    end
  end
end
