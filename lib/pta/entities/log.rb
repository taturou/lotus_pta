require 'lotus/entity'

class Log
  include Lotus::Entity
  attributes :http_client_ip, :http_user_agent, :spectator_id, :accessed_at # :id is implicit

  def spectator=(spectator)
    self.spectator_id = spectator.id
  end

  def spectator
    @spectator ||= SpectatorRepository.find(spectator_id)
  end

  def user
    @user ||= self.spectator.user
  end

  def article
    @article ||= self.spectator.article
  end
end
