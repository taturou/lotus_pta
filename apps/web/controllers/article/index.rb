module Web::Controllers::Article
  class Index
    include Web::Action

    expose :articles

    def call(params)
      @articles = ArticleRepository.all
    end
  end

  class Show
    include Web::Action

    expose :article, :users

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @users = UserRepository.parents
      @users.delete(@article.user)
    end
  end

  class Link
    include Web::Action

    expose :article, :user, :spectator

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @user = UserRepository.find(params[:user_id])
      @spectator = Spectator.new
      @spectator.article = @article
      @spectator.user = @user
      SpectatorRepository.persist(@spectator)
    end
  end
end
