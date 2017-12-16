Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
  		resources :users
      get 'current_users', to: 'users#current_user'
  		resources :advertisements
    	post 'authenticate', to: 'authentication#authenticate'
    	post 'auth/login', to: 'users#login'
    	resources :categorys
  	end
  end
end