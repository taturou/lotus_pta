require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/pta_sqlite3'
require_relative '../apps/announce/application'

Lotus::Container.configure do
  mount Announce::Application, at: 'announce'
end
