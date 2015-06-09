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

    def read_icon(article, reader)
      if submitted?(article, reader)
        html.i(class: 'fa fa-check-square-o'){}
      elsif opened?(article, reader)
        html.i(class: 'fa fa-folder-open-o'){}
      else
        html.i(class: 'fa fa-folder-o'){}
      end
    end

    def read_date(article, reader)
      unless opened?(article, reader)
        html.a(href: routes.path(:link_article, id: article.id, reader_user_id: reader.id)) do
          i(class: 'fa fa-share'){}
        end
      else
        accessed_at(article, reader)
      end
    end

    private

    def opened?(article, reader)
      logs = logs_as_article(article, reader)
      logs.delete_if do |log|
        log.kind != Log::KIND_OPEN
      end
      logs.length > 0
    end

    def submitted?(article, reader)
      logs = logs_as_article(article, reader)
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.length > 0
    end

    def accessed_at(article, reader)
      logs_as_article(article, reader).first.accessed_at.mdHM
    end

    def logs_as_article(article, reader)
      logs = article.logs_query.all
      logs.delete_if do |log|
        log.reader.id != reader.id
      end
    end
  end
end
