Rails.application.routes.draw do
resources :declarations
root "declarations#index"
# /spendings_export
get '/declaration_export' => 'declarations#export'
resources :declarations do
  member do
    # /agreements/:id/export
    get 'export'
  end
end
end
