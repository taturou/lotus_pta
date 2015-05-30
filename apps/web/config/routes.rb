# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Pta::Controllers::Home::Index` action in `apps/web/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
get '/', to: 'home#index'
get '/article', to: 'article#index'
get '/article/:id', id: /\d+/, to: 'article#show'
get '/user', to: 'user#index'
get '/user/:id', id: /\d+/, to: 'user#show'
get '/user/:name', name: /[A-Za-z_\-]+/, to: 'user#show'
get '/user/id/:id', to: 'user#show'
get '/user/name/:name', to: 'user#show'
