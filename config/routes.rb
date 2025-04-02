Rails.application.routes.draw do
  root to: 'home#index'  # Home page route

  resources :quizzes, only: [:show] do
    member do  # For submitting an answer
      get 'question/:category/:index', to: 'quizzes#show', as: "question"
      post 'answer/:category/:index', to: 'quizzes#answer', as: "answer"
    end
  end

  get 'quiz/complete', to: 'quizzes#complete', as: :quiz_complete  # Route for quiz completion page

  resource :session
  resources :passwords, param: :token
  resource :registration, only: %i[new create]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
