require 'lotus/repository'

class LogRepository
  include Lotus::Repository

  def self.query_by_article(article)
    query do
      where(article_id: article.id)
    end
  end

  def self.query_by_reader(user)
    query do
      where(reader_user_id: user.id)
    end
  end
end
