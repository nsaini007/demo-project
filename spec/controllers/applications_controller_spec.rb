require 'rails_helper'
RSpec.describe ApplicationsController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryBot.create(:applicant) }
    let(:job) { FactoryBot.create(:job) }

    before do
      user.confirm
      sign_in user
    end

    context "with valid params" do
      it "creates a new application" do
        expect {
          post :create, params: { job_id: job.id }
        }.to change(Application, :count).by(1)
      end

      it "redirects to the job page" do
        post :create, params: { job_id: job.id }
        expect(response).to redirect_to(job_path(id: job.id))
      end

      it "sets a success message" do
        post :create, params: { job_id: job.id }
        expect(flash[:alert]).to eq("Job applied successfully")
      end
    end

    context "when the user has already applied to the job" do
      let!(:application) { FactoryBot.create(:application, applicant: user, job: job) }

      it "does not create a new application" do
        expect {
          post :create, params: { job_id: job.id }
        }.to_not change(Application, :count)
      end

      it "redirects to the job page" do
        post :create, params: { job_id: job.id }
        expect(response).to redirect_to(job_path(id: job.id))
      end

      it "sets an error message" do
        post :create, params: { job_id: job.id }
        expect(flash[:alert]).to eq("You have already applied to this job")
      end
    end
  end
end