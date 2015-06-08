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
      html.span do
        i(class: 'fa fa-folder-open-o'){}
        span do
          "#{logs.length}/#{parents.length - 1}"
        end
      end
    end

    def num_checked(article)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.uniq! do |log|
        log.user.id
      end
      html.span do
        i(class: 'fa fa-check-square-o'){}
        span do
          "#{logs.length}/#{parents.length - 1}"
        end
      end
    end
  end
end
