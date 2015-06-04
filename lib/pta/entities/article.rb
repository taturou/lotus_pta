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

  def access_log(desc = true, limit = 0)
    return @access_log if @access_log

    query = RequestRepository.array_by_article(self)
    query = query.desc(:id) if desc
    query = query.limit(limit) if limit > 0
    query.all
  end
end
