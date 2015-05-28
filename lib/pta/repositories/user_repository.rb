require 'lotus/repository'

class UserRepository
  include Lotus::Repository

  def self.find_by_name(name)
    self.all.each do |user|
      if user.name == name
        return user
      end
    end
    nil
  end
end
