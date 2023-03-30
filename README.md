# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# demo-project

# Things to remember

It will give applicant's profile = ApplicantProfile.last.applicant.applicant_profile

current_user will return in controller only if called explicitely i.e. inside a function OR in before action

 Applicant.last.applications.last.job
 Applicant.last.applications
 Application.last.applicant
 Application.last.job
 Job.third_to_last.applications.find(applicant_id: 13)
 Applicant.last.applications.first_or_create!(job_id: 31)
Applicant.last.applications.find_or_create_by!(job_id: 31)

Recruiter.second.jobs.last.applications.last.applicant

current_user.jobs.find(params[:id]).applications

