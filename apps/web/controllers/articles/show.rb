module Web::Controllers::Articles
  class Show
    include Web::Action

    expose :article, :parents

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      @parents = UserRepository.parents
      @parents.delete(@article.owner)
    end
  end
end
