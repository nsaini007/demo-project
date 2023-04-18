class Applicants::BaseController < ApplicationController
    before_action :authenticate_user!, :authenticate_applicant!
    layout 'applicant'
end
