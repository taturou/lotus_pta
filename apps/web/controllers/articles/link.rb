module Web::Controllers::Articles
  class Link
    include Web::Action

    expose :login_user
    expose :article, :reader, :spectator

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @reader = UserRepository.find(params[:reader_user_id])
      @spectator = SpectatorRepository.create(@article, @reader)
    end
  end
end
