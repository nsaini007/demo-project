require 'rails_helper'
RSpec.describe Recruiters::BaseController do

  let(:recruiter) { create(:recruiter) }
  before do
      recruiter.confirm
      sign_in(recruiter)
  end
  
  describe "layout" do
      it "sets the layout to 'recruiter'" do
      # response.should render_template(:layout => nil)
      expect(controller).to render_template(layout: nil)
      end
  end

end