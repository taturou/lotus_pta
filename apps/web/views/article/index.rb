module Web::Views::Article
  class Index
    include Web::View
  end

  class Show
    include Web::View

    def already_read?(user)
      index = requests.index do |request|
        request.user.id == user.id
      end
      index != nil
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
