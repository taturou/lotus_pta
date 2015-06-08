module Web::Controllers::Articles
  class Update
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article = ArticleRepository.update(article)
      redirect_to routes.path(:article, id: article.id)
    end
  end
end
