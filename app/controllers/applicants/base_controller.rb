class Applicants::BaseController < ApplicationController
    before_action :authenticate_user!, :applicant?
    # layout 'applicant'
end
