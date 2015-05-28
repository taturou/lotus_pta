require_relative '../../config/environment'

module PTA
  class Migrator
    require 'sequel'
    Sequel.extension :migration

    def self.migrate!
      db = Sequel.connect(ENV.fetch('PTA_DATABASE_URL'))
      Sequel::Migrator.run(db, "#{__dir__}/../../db/migrations")
    end
  end
end
