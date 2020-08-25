Rails.application.routes.draw do

  root 'static_notes#home'

  get '/about', to: "static_notes_#about"
 resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
