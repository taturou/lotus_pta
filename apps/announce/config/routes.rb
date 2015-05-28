# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Announce::Controllers::Home::Index` action in `apps/announce/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
get '/', to: 'home#index'
get '/article', to: 'article#index'
get '/article/:id', to: 'article#show'
