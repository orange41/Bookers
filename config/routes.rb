Rails.application.routes.draw do
  root 'books#top'
  get '/', to: redirect('/top')  
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
end