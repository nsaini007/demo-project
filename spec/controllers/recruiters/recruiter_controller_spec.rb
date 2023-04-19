require 'rails_helper'

RSpec.describe Recruiters::RecruiterController, type: :controller do
    
    before do
        recruiter.confirm
        sign_in(recruiter)
    end

    describe "#index" do
        let(:recruiter) {create(:recruiter)}
        let!(:job1) { create(:job, recruiter: recruiter) }
        let!(:job2) { create(:job, recruiter: recruiter) }
        
        # it {debugger}
        it "returns a successful response" do
            # debugger
            get :index
            expect(response).to be_successful
        end
    
        it "returns all jobs" do
            get :index
            expect(assigns(:recruiter_jobs)).to eq([job2, job1])
        end
    
    end
end