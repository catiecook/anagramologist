Rails.application.routes.draw do

  post '/search', to: 'pages#search'

  get '/:word', to: 'pages#word'

  # get '/' do
  #   File.open("app/assets/files/dictionary.txt", 'r');
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

end
