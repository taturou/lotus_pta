require 'lotus/model'
Dir["#{ __dir__ }/pta/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/pta_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/pta_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/pta_development'
  #    adapter type: :sql, uri: 'mysql://localhost/pta_development'
  #
  adapter type: :sql, uri: ENV['PTA_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  # mapping do
  #   # collection :users do
  #   #   entity     User
  #   #   repository UserRepository
  #   #
  #   #   attribute :id,   Integer
  #   #   attribute :name, String
  #   # end
  # end
end.load!
