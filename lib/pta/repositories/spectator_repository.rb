require 'lotus/repository'

class SpectatorRepository
  include Lotus::Repository

  def self.find_by_md5(md5)
    query do
      where(md5: md5)
    end.first
  end
end
