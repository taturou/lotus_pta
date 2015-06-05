require 'lotus/repository'

class LogRepository
  include Lotus::Repository

  def self.array_by_article(article)
    query do
      where(article_id: article.id)
    end
  end

  def self.array_by_user(user)
    query do
      where(user_id: user.id)
    end
  end
end
