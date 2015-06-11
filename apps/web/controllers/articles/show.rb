module Web::Controllers::Articles
  class Show
    include Web::Action

    expose :login_user
    expose :login_user, :article, :parents

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless login_user

      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @parents = UserRepository.parents
      @parents.delete(@article.owner)
    end
  end
end
