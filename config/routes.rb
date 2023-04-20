Rails.application.routes.draw do
  # namespace :recruiters do
  #   get 'recruiter_applications/index'
  # end
  scope module: :applicants do
    resources :applicant_profile, except: [:index] 
  end

  scope module: :recruiters do
    resources :recruiter_profile, except: [:index] 
    post 'recruiter_checkout', to: 'recruiter_checkout#create'
    resources :recruiter, only: [:index] do
      resources :recruiter_applications do
        patch :accept, :reject
      end
      resources :recruiter_jobs, except: [:show]
    end
  end

  resources :jobs, only: [:index, :show]
  root 'home#index'
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions"}
  get 'confirmation_pending' => 'overide#after_registration_path'

  resources :applications, only: [:create]
  # resources :recruiter, only: [:index] do
  #   resources :jobs    
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
