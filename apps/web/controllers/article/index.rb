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

    expose :article, :requests, :users

    def call(params)
      @article = ArticleRepository.find(params[:id])
      @requests = RequestRepository.find_by_article(@article)
      @users = UserRepository.all
      @users.delete(@article.user)
    end
  end

  class Link
    include Web::Action

    expose :article, :user

    def call(params)
      @article = ArticleRepository.find(params[:id])
      @user = UserRepository.find(params[:user_id])
    end
  end
end
