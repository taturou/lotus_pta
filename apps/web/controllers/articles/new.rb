module Web::Controllers::Articles
  class New
    include Web::Action

    expose :article

    def call(params)
      owner = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      @article = Article.new
      @article.owner = owner
    end
  end
end
