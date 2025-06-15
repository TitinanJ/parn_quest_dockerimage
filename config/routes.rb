Rails.application.routes.draw do
  get "brag/index"
  root "quests#index"
  resources :quests do
    member do
      patch :toggle_complete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
