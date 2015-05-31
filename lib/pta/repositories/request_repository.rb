require 'lotus/repository'

class RequestRepository
  include Lotus::Repository

  def self.find_by_article(article)
    query do
      where(article_id: article.id)
    end.all
  end
end
