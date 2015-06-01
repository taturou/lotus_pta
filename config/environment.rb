require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/pta'
require_relative '../apps/web/application'
require_relative '../apps/news/application'

Lotus::Container.configure do
  mount News::Application, at: '/news'
  mount Web::Application, at: '/'
end
