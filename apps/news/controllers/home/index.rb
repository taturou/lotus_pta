module News::Controllers::Home
  class Index
    include News::Action

    expose :article, :user

    def save_request(params, spectator)
      http_client_ip = params.env['HTTP_X_FORWARDED_FOR'] || params.env['REMOTE_ADDR']
      http_user_agent = params.env['HTTP_USER_AGENT']
      request = ::Request.new({http_client_ip: http_client_ip,
                               http_user_agent: http_user_agent})
      request.spectator = spectator
      request.requested_at = Time.now
      RequestRepository.persist(request)
    end

    def call(params)
      spectator = SpectatorRepository.find_by_md5(params['md5'])
      @article = spectator.article
      @user = spectator.user
      save_request(params, spectator)
    end
  end
end
