Rails.application.routes.draw do
  root to: redirect('/cocktails')

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
end
