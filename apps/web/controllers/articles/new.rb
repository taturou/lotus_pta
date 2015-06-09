module Web::Controllers::Articles
  class New
    include Web::Action

    expose :article

    def call(params)
      user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      @article = Article.new
      @article.user = user
    end
  end
end
