require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/pta'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Pta::Application, at: '/'
end
