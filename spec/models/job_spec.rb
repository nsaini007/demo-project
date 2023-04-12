require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { create :job }

  context 'when creating a job' do

    it 'should be valid job with all attributes' do
      expect(job.valid?).to eq(true)
    end
  end

  describe 'associations' do
    it { should belong_to(:recruiter).class_name('User') }
    it { should have_many(:applications).dependent(:destroy) }
  end
  
  describe 'methods' do
    let(:job) { create(:job) }
    
    describe '#count_applicants' do
      it 'returns the count of applications for the job' do
        expect(job.count_applicants).to eq(0)
        
        create_list(:application, 3, job: job)
        
        expect(job.count_applicants).to eq(3)
      end
    end
  end
  
  describe 'class methods' do
    describe '.ransackable_attributes' do
      it 'returns an array of ransackable attributes' do
        expect(Job.ransackable_attributes).to contain_exactly(
          "created_at", "description", "id", "job_type", "recruiter_id", "salary", "title", "updated_at", "vacancies"
        )
      end
    end
  end
end
