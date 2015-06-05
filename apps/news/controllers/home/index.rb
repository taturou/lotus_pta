module News::Controllers::Home
  class Index
    include News::Action

    expose :article, :user

    def save_log(params, spectator)
      http_client_ip = params.env['HTTP_X_FORWARDED_FOR'] || params.env['REMOTE_ADDR']
      http_user_agent = params.env['HTTP_USER_AGENT']
      log = ::Log.new({http_client_ip: http_client_ip,
                               http_user_agent: http_user_agent})
      log.spectator = spectator
      log.accessed_at = Time.now
      LogRepository.persist(log)
    end

    def call(params)
      spectator = SpectatorRepository.find_by_md5(params['md5'])
      halt 404 unless spectator

      @article = spectator.article
      @user = spectator.user
      save_log(params, spectator)
    end
  end
end
