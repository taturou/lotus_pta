module Web::Controllers::Articles
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

  class New
    include Web::Action

    expose :user, :article

    def call(params)
      @user = UserRepository.find(1) #@@@ ログインユーザの user.id
      @article = Article.new
    end
  end

  class Create
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article = ArticleRepository.persist(article)
      redirect_to routes.path(:article, id: article.id)
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
