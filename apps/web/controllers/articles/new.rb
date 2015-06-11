module Web::Controllers::Articles
  class New
    include Web::Action

    expose :article

    def call(params)
      login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless login_user

      @article = Article.new
      @article.owner = login_user
    end
  end
end
