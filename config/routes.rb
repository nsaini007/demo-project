Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: "devise_overide/registrations"}
  get 'confirmation_pending' => 'overide#after_registration_path'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
