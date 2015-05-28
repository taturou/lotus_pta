require 'lotus/entity'

class User
  include Lotus::Entity
  attributes :name # :id is implicit
end
