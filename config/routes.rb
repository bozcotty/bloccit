Bloccit::Application.routes.draw do
  
  

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  match "about" => 'welcome#about', via: :get #made the about route more clean by 
  #writing this line but needs explanation

  root to: 'welcome#index' #declares default page when user types the home page url
  
end
