require 'lotus/repository'

class RequestRepository
  include Lotus::Repository

  def self.find_by_article(article)
    requests = self.all
    requests.delete_if do |request|
      request.article.id != article.id
    end
    requests
  end
end
