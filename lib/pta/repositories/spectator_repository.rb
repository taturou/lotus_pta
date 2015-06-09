require 'lotus/repository'

class SpectatorRepository
  include Lotus::Repository

  def self.create(article, reader)
    tmp = Spectator.new
    tmp.article = article
    tmp.reader = reader
    spectator = SpectatorRepository.find_by_md5(tmp.md5)
    spectator = SpectatorRepository.persist(tmp) unless spectator
    return spectator
  end

  def self.find_by_md5(md5)
    query do
      where(md5: md5)
    end.first
  end
end
