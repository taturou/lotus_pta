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

  def logs(desc = true, limit = 0)
    return @logs if @logs

    query = LogRepository.array_by_article(self)
    query = query.desc(:id) if desc
    query = query.limit(limit) if limit > 0
    @logs = query.all
    @logs.delete_if do |log|
      log.user == nil
    end
  end
end
