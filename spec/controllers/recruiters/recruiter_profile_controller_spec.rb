require 'rails_helper'

RSpec.describe Recruiters::RecruiterProfileController, type: :controller do
    let(:recruiter) {create(:recruiter)}
    let(:company) {create(:company)}
    let(:recruiter_profile) {create(:recruiter_profile, recruiter: recruiter, company: company)}

    
    before do
        recruiter.confirm
        sign_in(recruiter)
    end

    describe "#show" do
        it "returns a successful response" do
            get :show, params: { id: recruiter.id }
            expect(response).to be_successful
        end

        it "finds the recruiter profile" do
            get :show, params: { id: recruiter_profile.id }
            expect(assigns[:profile]).to eq(recruiter_profile)
        end
    end

    describe '#new' do   
        it "renders the new template" do
            get :new, params: {id: recruiter.id}
            expect(response).to render_template('recruiters/recruiter_profile/new')
        end
    end

    describe '#create' do
        it 'creates the new recruiter_profile' do
            debugger
            expect {
                post :create, params: { recruiter_profile: {
                    recruiter_id: recruiter.id,
                    company_id: company.id
                } }
            }.to change(RecruiterProfile, :count).by(1)
        end
    end
    
    describe '#update' do
        it 'updates the job' do
            put :update, params: { id: recruiter_profile.id, recruiter_profile: {company_id: 1}}
            expect(assigns[:profile].company_id).to eq(1)
        end
    end
end