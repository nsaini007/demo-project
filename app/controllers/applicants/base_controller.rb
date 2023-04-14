class Applicants::BaseController < ApplicationController
    before_action :authenticate_user!
    layout 'applicant'
end
