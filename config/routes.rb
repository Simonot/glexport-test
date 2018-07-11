Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'api/v1/shipments' => 'api/v1/shipments#index'
  
  match '*path', via: :all, to: 'application#route_not_found'
end
