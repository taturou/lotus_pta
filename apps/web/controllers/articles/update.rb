module Web::Controllers::Articles
  class Update
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article.title.strip!
      article.content.strip!
      redirect_to routes.path(:edit_article, id: article.id) if (article.title.length == 0) || (article.content.length == 0)

      article = ArticleRepository.update(article)
      redirect_to routes.path(:article, id: article.id)
    end
  end
end
