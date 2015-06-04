module Web::Views::Article
  class Index
    include Web::View
  end

  class Show
    include Web::View

    def access_log(user)
      def user.access_log_as_article(article)
        @article_log = [] unless @article_log
        @article_log[article.id] = self.access_log
        @article_log[article.id].delete_if do |request|
          request.article.id != article.id
        end
      end
      user.access_log_as_article(article)
    end

    def already_read?(user)
      access_log(user).length > 0
    end
  end

  class Link
    include Web::View

    def url
      uri = URI.parse(params.env['REQUEST_URI'])
      root = "#{uri.scheme}://#{uri.host}"
      root += ":#{uri.port}" unless uri.port == 80
      "#{root}/news/#{spectator.md5}"
    end
  end
end
