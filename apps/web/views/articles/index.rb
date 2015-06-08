module Web::Views::Articles
  class Index
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-book'}
        ])
    end

    def num_readed(article)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.kind != Log::KIND_OPEN
      end
      logs.uniq! do |log|
        log.user.id
      end
      "#{logs.length}/#{users.length - 1}"
    end

    def num_checked(article)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.uniq! do |log|
        log.user.id
      end
      "#{logs.length}/#{users.length - 1}"
    end
  end

  class Show
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-book', url: routes.path(:articles)},
          {icon: 'fa-file-text-o'}
        ])
    end

    def logs_as_article(user, article)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.user.id != user.id
      end
      logs
    end

    def opened?(user)
      logs = logs_as_article(user, article)
      logs.delete_if do |log|
        log.kind != Log::KIND_OPEN
      end
      logs.length > 0
    end

    def submitted?(user)
      logs = logs_as_article(user, article)
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.length > 0
    end

    def accessed_at(user)
      logs_as_article(user, article).first.accessed_at.mdHM
    end
  end

  class New
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-pencil'}
        ])
    end
  end

  class Edit
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-book', url: routes.path(:articles)},
          {icon: 'fa-file-text-o', url: routes.path(:article, id: article.id)},
          {icon: 'fa-edit'}
        ])
    end
  end

  class Link
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-book', url: routes.path(:articles)},
          {icon: 'fa-file-text-o', url: routes.path(:article, id: article.id)},
          {icon: 'fa-share'}
        ])
    end

    def url
      uri = URI.parse(params.env['REQUEST_URI'])
      root = "#{uri.scheme}://#{uri.host}"
      root += ":#{uri.port}" unless uri.port == 80
      "#{root}/news/#{spectator.md5}"
    end
  end
end
