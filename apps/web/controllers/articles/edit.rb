module Web::Controllers::Articles
  class Edit
    include Web::Action

    expose :login_user
    expose :article

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article
    end
  end
end
