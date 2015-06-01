# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `News::Controllers::Home::Index` action in `apps/news/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
get '/:hash', hash: /[0-9a-z]+/, to: 'home#index'
