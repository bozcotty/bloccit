Bloccit::Application.routes.draw do
  get "welcome/index"

  get "welcome/about"

  root to: 'welcome#index' #declares default page when user types the home page url
  
end
