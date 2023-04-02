class Recruiters::BaseController < ApplicationController
    before_action :authenticate_user!
    layout 'recruiter'
end
