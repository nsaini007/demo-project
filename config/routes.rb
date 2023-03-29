Rails.application.routes.draw do
  scope module: :applicants do
    resources :applicant_profile, except: [:index] 
  end

  scope module: :recruiters do
    resources :recruiter, only: [:index] do
      resources :recruiter_jobs, except: [:show]
    end
  end

  resources :jobs, only: [:index, :show]
  root 'home#index'
  devise_for :users, controllers: { registrations: "users/registrations"}
  get 'confirmation_pending' => 'overide#after_registration_path'

  resources :applications, only: [:create]
  # resources :recruiter, only: [:index] do
  #   resources :jobs    
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
