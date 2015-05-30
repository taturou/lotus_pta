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

    expose :article

    def call(params)
      @article = ArticleRepository.find(params[:id])
    end
  end
end
