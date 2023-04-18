class Recruiters::BaseController < ApplicationController
    before_action :authenticate_user!, :authenticate_recruiter!
    layout 'recruiter'
end
