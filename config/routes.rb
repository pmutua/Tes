Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


# nest comments within messages
	resources :messages do 
		resources :comments
	end
	
	root 'messages#index'
end
