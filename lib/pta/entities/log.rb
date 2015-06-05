require 'lotus/entity'

class Log
  include Lotus::Entity
  attributes :http_client_ip, :http_user_agent, :kind, :user_id, :article_id, :accessed_at # :id is implicit

  KIND_OPEN = 1
  KIND_SUBMIT = 2
  KIND_LOGIN = 3

  def user=(user)
    self.user_id = user.id
  end

  def user
    @user ||= UserRepository.find(user_id)
  end

  def article=(article)
    self.article_id = article.id
  end

  def article
    @article ||= ArticleRepository.find(article_id)
  end
end
