# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Web::Controllers::Home::Index` action in `apps/web/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
get '/', to: 'home#index', as: :home
resources :articles
get '/articles/:id/link/:reader_user_id', id: /\d+/, reader_user_id: /\d+/, to: 'articles#link', as: :link_article
resources :users, only: [:index, :show]
