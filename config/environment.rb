require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/pta'
require_relative '../apps/admin/application'
require_relative '../apps/web/application'
require_relative '../apps/news/application'

Lotus::Container.configure do
  mount Admin::Application, at: 'admin'
  mount News::Application, at: '/news'
  mount Web::Application, at: '/'
end
