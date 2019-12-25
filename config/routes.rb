Rails.application.routes.draw do
  get 'labels/index'
  get 'labels/report'
  post 'labels/load_labels'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
