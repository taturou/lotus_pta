module Web::Controllers::Articles
  class Create
    include Web::Action

    def call(params)
      article = Article.new(params[:article])
      article.title.strip!
      article.content.strip!
      redirect_to routes.path(:new_article) if (article.title.length == 0) || (article.content.length == 0)

      article = ArticleRepository.persist(article)
      redirect_to routes.path(:article, id: article.id)
    end
  end
end
