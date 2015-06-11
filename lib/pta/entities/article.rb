require 'lotus/entity'

class Article
  include Lotus::Entity
  attributes :title, :content, :owner_user_id, :created_at # :id is implicit

  def owner=(user)
    self.owner_user_id = user.id
  end

  def owner
    @user ||= UserRepository.find(owner_user_id)
  end

  def logs_query(desc = true)
    query = LogRepository.query_by_article(self)
    query = query.desc(:id) if desc
  end

  def num_read
    logs = self.logs_query.all
    logs.delete_if do |log|
      log.kind != Log::KIND_OPEN
    end
    logs.uniq! do |log|
      log.reader.id
    end
    logs.length
  end

  def num_checked
    logs = self.logs_query.all
    logs.delete_if do |log|
      log.kind != Log::KIND_SUBMIT
    end
    logs.uniq! do |log|
      log.reader.id
    end
    logs.length
  end
end
