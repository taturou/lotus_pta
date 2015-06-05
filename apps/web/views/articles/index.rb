module Web::Views::Articles
  class Index
    include Web::View

    def num_readed(article)
      requests = article.access_log.uniq do |request|
        request.user.id
      end
      "#{requests.length}/#{users.length - 1}"
    end

    def num_checked(article)
      num_readed(article)
    end
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

  class New
    include Web::View
  end

  class Edit
    include Web::View
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
