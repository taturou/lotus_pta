module Web::Controllers::Articles
  class Create
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article = ArticleRepository.persist(article)
      redirect_to routes.path(:article, id: article.id)
    end
  end
end
