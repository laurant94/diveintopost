Rails.application.routes.draw do
  root 'statics#top'
  get :dashboard, to: 'teams#dashboard', as: :dashboard

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resource :user
  
  resources :teams do
    member do
      post "assign-owner", to: "teams#assign_owner", as: :assign_owner_to
    end
    resources :assigns, only: %w(create destroy)
    resources :agendas, shallow: true do
      resources :articles do
        resources :comments
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
