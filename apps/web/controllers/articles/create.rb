module Web::Controllers::Articles
  class Create
    include Web::Action

    expose :login_user

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      article = Article.new(params[:article])
      article.title.strip!
      article.content.strip!
      redirect_to routes.path(:new_article) if (article.title.length == 0) || (article.content.length == 0)

      article = ArticleRepository.persist(article)
      redirect_to routes.path(:article, id: article.id)
    end
  end
end
