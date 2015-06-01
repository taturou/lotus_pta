require 'lotus/entity'

class Request
  include Lotus::Entity
  attributes :http_client_ip, :http_user_agent, :article_id, :user_id, :requested_at # :id is implicit

  def user=(user)
    self.user_id = user.id
  end

  def user
    @user ||= UserRepository.find(self.user_id)
  end

  def article=(article)
    self.article_id = article.id
  end

  def article
    @article ||= ArticleRepository.find(self.article_id)
  end
end
