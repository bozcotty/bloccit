Bloccit::Application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get #made the about route more clean by 
  #writing this line but needs explanation

  root to: 'welcome#index' #declares default page when user types the home page url
  
end
