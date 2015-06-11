module Web::Controllers::Articles
  class Destroy
    include Web::Action

    expose :login_user

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      article = ArticleRepository.find(params[:id])
      halt 404 unless article

      ArticleRepository.delete(article)
      redirect_to routes.path(:articles)
    end
  end
end
