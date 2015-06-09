module Web::Controllers::Articles
  class Link
    include Web::Action

    expose :article, :reader, :spectator

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @reader = UserRepository.find(params[:reader_user_id])
      @spectator = SpectatorRepository.create(@article, @reader)
    end
  end
end
