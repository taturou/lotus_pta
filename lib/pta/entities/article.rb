require 'lotus/entity'

class Article
  include Lotus::Entity
  attributes :title, :content, :created_user_id, :created_at # :id is implicit

  def user=(user)
    self.created_user_id = user.id
  end

  def user
    @user ||= UserRepository.find(created_user_id)
  end
end
