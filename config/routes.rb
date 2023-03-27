Rails.application.routes.draw do
  get 'applicant_profile/index'
  get 'jobs', to: "jobs#index"
  root 'home#index'
  devise_for :users, controllers: { registrations: "users/registrations"}
  get 'confirmation_pending' => 'overide#after_registration_path'
  get '/profile' => "recruiter#upload"

  resources :recruiter, only: [:index] do
    resources :jobs    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
