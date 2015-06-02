require 'lotus/repository'

class SpectatorRepository
  include Lotus::Repository

  def self.find_by_md5(md5)
    query do
      where(md5: md5)
    end.first
  end

  def self.id_array_by_article(article)
    query do
      select(:id).where(article_id: article.id)
    end.run.all.map do |e|
      e[:id]
    end
  end
end
