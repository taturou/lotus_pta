module Web::Controllers::Articles
  class Link
    include Web::Action

    expose :article, :user, :spectator

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @user = UserRepository.find(params[:user_id])
      @spectator = SpectatorRepository.create(@article, @user)
    end
  end
end
