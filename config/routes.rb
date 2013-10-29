Bloccit::Application.routes.draw do
  
  

  get "comments/index"

  get "comments/new"

  get "comments/show"

  get "comments/edit"

  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get #made the about route more clean by 
  #writing this line but needs explanation

  root to: 'welcome#index' #declares default page when user types the home page url
  
end
