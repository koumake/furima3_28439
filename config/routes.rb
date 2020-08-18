Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchases, only:[:index, :create] do
      collection do
        post 'done', to: 'purchases#done'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
