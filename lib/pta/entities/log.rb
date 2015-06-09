require 'lotus/entity'

class Log
  include Lotus::Entity
  attributes :http_client_ip, :http_user_agent, :kind, :reader_user_id, :article_id, :accessed_at # :id is implicit

  KIND_OPEN = 1
  KIND_SUBMIT = 2

  def reader=(user)
    self.reader_user_id = user.id
  end

  def reader
    @user ||= UserRepository.find(reader_user_id)
  end

  def article=(article)
    self.article_id = article.id
  end

  def article
    @article ||= ArticleRepository.find(article_id)
  end
end
