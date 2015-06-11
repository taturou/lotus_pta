module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :login_user
    expose :articles, :parents

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @articles = ArticleRepository.all
      @parents = UserRepository.parents
    end
  end
end
