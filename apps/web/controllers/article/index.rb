module Pta::Controllers::Article
  class Index
    include Pta::Action

    expose :articles

    def call(params)
      @articles = ArticleRepository.all
    end
  end

  class Show
    include Pta::Action

    expose :article, :requests, :users

    def call(params)
      @article = ArticleRepository.find(params[:id])
      @requests = RequestRepository.find_by_article(@article)
      @users = UserRepository.all
      @users.delete(@article.user)
    end
  end
end
