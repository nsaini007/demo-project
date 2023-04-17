require 'rails_helper'

RSpec.describe Recruiters::RecruiterJobsController, type: :controller do
    let(:recruiter) {create(:recruiter)}
    let!(:job1) { create(:job, recruiter: recruiter) }
    let!(:job2) { create(:job, recruiter: recruiter) }
    
    before do
        recruiter.confirm
        sign_in(recruiter)
    end

    describe '#new' do   
        it "renders the new template" do
            get :new, params: {recruiter_id: recruiter.id}
            expect(response).to render_template('recruiters/recruiter_jobs/new')
        end
    end

    describe '#create' do
        # let!(:job) { create(:job, recruiter: recruiter) }
        it 'creates the new job' do
            expect {
                post :create, params: {recruiter_id: recruiter.id, job: attributes_for(:job)}
            }.to change(Job, :count).by(1)
        end
    end

    describe '#edit' do   
        it "renders the edit template" do
            get :edit, params: {recruiter_id: recruiter.id, id: job1.id}
            expect(response).to render_template('recruiters/recruiter_jobs/edit')
        end
    end

    # let!(:job) { create(:job, recruiter: recruiter) }
    # describe '#update' do
    #     # let!(:job) { create(:job, recruiter: recruiter) }
    #     job.title = "hello"
    #     job.save
    #     it 'updates the job' do
    #         put :update, params: { recruiter_id: recruiter.id, job: job.id }
    #         # project.reload
    #         expect(job.name).to eq("hello")
    #     end
    # end
end