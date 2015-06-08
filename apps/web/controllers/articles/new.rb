module Web::Controllers::Articles
  class New
    include Web::Action

    expose :article

    def call(params)
      @article = Article.new
      @article.created_user_id = 1 #@@@ ログインユーザの user.id
    end
  end
end
