require 'lotus/repository'

class RequestRepository
  include Lotus::Repository

  def self.find_by_article(article)
    query do
      where(spectator_id: SpectatorRepository.id_array_by_article(article))
    end.all
  end
end
