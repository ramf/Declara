Rails.application.routes.draw do
resources :declarations
# /spendings_export
get '/declaration_export' => 'declarations#export'
resources :declarations do
  member do
    # /agreements/:id/export
    get 'export'
  end
end
end
