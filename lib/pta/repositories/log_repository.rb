require 'lotus/repository'

class LogRepository
  include Lotus::Repository

  def self.array_by_article(article)
    def SpectatorRepository.id_array_by_article(article)
      query do
        select(:id).where(article_id: article.id)
      end.run.all.map do |e|
        e[:id]
      end
    end

    query do
      where(spectator_id: SpectatorRepository.id_array_by_article(article))
    end
  end

  def self.array_by_user(user)
    def SpectatorRepository.id_array_by_user(user)
      query do
        select(:id).where(user_id: user.id)
      end.run.all.map do |e|
        e[:id]
      end
    end

    query do
      where(spectator_id: SpectatorRepository.id_array_by_user(user))
    end
  end
end
