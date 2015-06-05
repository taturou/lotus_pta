module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :articles, :users

    def call(params)
      @articles = ArticleRepository.all
      @users = UserRepository.parents
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

    expose :article

    def call(params)
      @article = Article.new
      @article.created_user_id = 1 #@@@ ログインユーザの user.id
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

  class Edit
    include Web::Action

    expose :article

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article
    end
  end

  class Update
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article = ArticleRepository.update(article)
      # use halt # redirect_to routes.path(:article, id: article.id)
      halt 200
    end
  end

  class Destroy
    include Web::Action

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      ArticleRepository.delete(@article)
      # use halt # redirect_to routes.path(:articles)
      halt 200
    end
  end

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
