require 'lotus/entity'

class Request
  include Lotus::Entity
  attributes :http_client_ip, :http_user_agent, :article_id, :requested_at # :id is implicit

  def article=(article)
    self.article_id = article.id
  end

  def article
    @article ||= ArticleRepository.find(self.article_id)
  end
end
