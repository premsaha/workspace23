Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json }, consttaints: { subdomain: 'api'}, path: '/' do
  end
end
