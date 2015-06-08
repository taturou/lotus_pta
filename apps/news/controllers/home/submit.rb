module News::Controllers::Home
  class Submit
    include News::Action

    expose :article, :user

    def log_submitted(params, user, article)
      http_client_ip = params.env['HTTP_X_FORWARDED_FOR'] || params.env['REMOTE_ADDR']
      http_user_agent = params.env['HTTP_USER_AGENT']
      log = ::Log.new({kind: Log::KIND_SUBMIT,
                       http_client_ip: http_client_ip,
                       http_user_agent: http_user_agent})
      log.user = user
      log.article = article
      log.accessed_at = Time.now
      LogRepository.persist(log)
    end

    def call(params)
      spectator = SpectatorRepository.find_by_md5(params['md5'])
      halt 404 unless spectator

      @article = spectator.article
      @user = spectator.user
      log_submitted(params, @user, @article)
    end
  end
end
