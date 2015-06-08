module Web::Controllers::Articles
  class Edit
    include Web::Action

    expose :article

    def call(params)
      @article = ArticleRepository.find(params[:id])
      halt 404 unless @article
    end
  end
end
