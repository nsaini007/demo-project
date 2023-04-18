require 'rails_helper'

RSpec.describe Recruiters::RecruiterApplicationsController, type: :controller do
    let(:applicant) {create(:applicant)}
    let(:recruiter) {create(:recruiter)}
    let(:job) {create(:job, recruiter: recruiter)}
    let(:application) {create(:application, job: job, applicant: applicant)}

    
    before do
        recruiter.confirm
        sign_in(recruiter)
    end

    describe "#index" do
        it "returns a successful response" do
            get :index, params: { recruiter_id: recruiter.id, id: job.id }
            expect(response).to be_successful
        end

        it "returns all applications" do
            get :index, params: { recruiter_id: recruiter.id, id: job.id }
            expect(assigns(:recruiter_applications)).to eq([application])
        end
    end

    describe '#accept' do
        it 'changes the application state to accepted' do
            patch :accept, params: application_params
            expect(assigns[:recruiter_applications].find(application.id).status).to eq('accepted')
        end
    end

    describe '#reject' do
        it 'changes the application state to rejected' do
            patch :reject, params: application_params
            expect(assigns[:recruiter_applications].find(application.id).status).to eq('rejected')
        end
    end

    def application_params
        {
            id: job.id, 
            recruiter_id: recruiter.id, 
            recruiter_application_id: application.id
        }
    end
end