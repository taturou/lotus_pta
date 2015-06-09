module Web::Views::Articles
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

    def read_icon(article, user)
      if submitted?(article, user)
        html.i(class: 'fa fa-check-square-o'){}
      elsif opened?(article, user)
        html.i(class: 'fa fa-folder-open-o'){}
      else
        html.i(class: 'fa fa-folder-o'){}
      end
    end

    def read_date(article, user)
      unless opened?(article, user)
        html.a(href: routes.path(:link_article, id: article.id, user_id: user.id)) do
          i(class: 'fa fa-share'){}
        end
      else
        accessed_at(article, user)
      end
    end

    private

    def opened?(article, user)
      logs = logs_as_article(article, user)
      logs.delete_if do |log|
        log.kind != Log::KIND_OPEN
      end
      logs.length > 0
    end

    def submitted?(article, user)
      logs = logs_as_article(article, user)
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.length > 0
    end

    def accessed_at(article, user)
      logs_as_article(article, user).first.accessed_at.mdHM
    end

    def logs_as_article(article, user)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.user.id != user.id
      end
    end
  end
end
