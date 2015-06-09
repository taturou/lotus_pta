module News::Controllers::Home
  class Show
    include News::Action

    expose :article, :reader

    def call(params)
      spectator = SpectatorRepository.find_by_md5(params['md5'])
      halt 404 unless spectator

      @article = spectator.article
      @reader = spectator.reader
      save_opened_log(params, @reader, @article)
    end

    private

    def save_opened_log(params, reader, article)
      http_client_ip = params.env['HTTP_X_FORWARDED_FOR'] || params.env['REMOTE_ADDR']
      http_user_agent = params.env['HTTP_USER_AGENT']
      log = ::Log.new({kind: Log::KIND_OPEN,
                       http_client_ip: http_client_ip,
                       http_user_agent: http_user_agent})
      log.reader = reader
      log.article = article
      log.accessed_at = Time.now
      LogRepository.persist(log)
    end
  end
end
