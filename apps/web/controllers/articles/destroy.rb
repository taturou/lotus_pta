module Web::Controllers::Articles
  class Destroy
    include Web::Action

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article

      ArticleRepository.delete(@article)
      redirect_to routes.path(:articles)
    end
  end
end
