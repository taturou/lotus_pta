module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :articles, :parents

    def call(params)
      @articles = ArticleRepository.all
      @parents = UserRepository.parents
    end
  end
end
