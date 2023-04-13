require 'rails_helper'

RSpec.describe JobsController, type: :controller do
    let(:applicant) { create(:applicant) }
    let(:recruiter) { create(:recruiter) }

    describe "#choose_layout" do
        it "chooses applicant layout for applicants" do
            applicant.confirm
            sign_in applicant
            expect(controller.choose_layout).to eq('applicant')
        end
    
        it "chooses recruiter layout for recruiters" do
            recruiter.confirm
            sign_in recruiter
            expect(controller.choose_layout).to eq('recruiter')
        end

        it "chooses application layout for non-authenticated users" do
            expect(controller.choose_layout).to eq('application')
        end
    end

    describe "#index" do
        let!(:job1) { create(:job, title: "Software Engineer") }
        let!(:job2) { create(:job, title: "Product Manager") }

        it "returns a successful response" do
            get :index
            expect(response).to be_successful
        end

        it "returns all jobs" do
            get :index
            expect(assigns(:jobs)).to eq([job2, job1])
        end

        it "searches for jobs" do
            get :index, params: { q: { title_cont: "Software" } }
            expect(assigns(:jobs)).to eq([job1])
        end
    end

    describe "#show" do
        let!(:job) { create(:job) }

        it "returns a successful response" do
            get :show, params: { id: job.id }
            expect(response).to be_successful
        end

        it "finds the job" do
            get :show, params: { id: job.id }
            expect(assigns(:job)).to eq(job)
        end
    end
end
