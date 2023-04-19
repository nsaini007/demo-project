require 'rails_helper'
RSpec.describe ApplicationsController, type: :controller do
  describe "POST #create" do
    # let(:user) { create(:applicant) }
    let(:applicant) { create(:applicant) }
    let(:job) { create(:job) }
    let(:params) { {job_id: job1.id, resume: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'resume.pdf'), 'application/pdf')} }
    let(:bad_params) { {job_id: job.id, resume: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'resume.pdf'), 'application/pdf')} }

    before do
      applicant.confirm
      sign_in applicant
    end

    context "with valid params" do
      let(:job1) { create(:job) }
      it "creates a new application" do
        expect {
          post :create, params: params
        }.to change(Application, :count).by(1)
      end

      
      it "sets a success message" do
        post :create, params: params
        expect(flash[:alert]).to eq("Job applied successfully")
      end

      it "redirects to the job page" do
        post :create, params: params
        expect(response).to redirect_to(job_path(id: job1.id))
      end
    end

    context "when the user has already applied to the job" do
      let!(:application) { FactoryBot.create(:application, applicant: applicant, job: job) }

      it "does not create a new application" do
        expect {
          post :create, params: bad_params
        }.to_not change(Application, :count)
      end

      it "redirects to the job page" do
        post :create, params: bad_params
        expect(response).to redirect_to(job_path(id: job.id))
      end

      it "sets an error message" do
        post :create, params: bad_params
        expect(flash[:alert]).to eq("You have already applied to this job")
      end
    end
  end
end