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

    def num_read(article)
      html.span do
        i(class: 'fa fa-folder-open-o'){}
        span do
          "#{article.num_read}/#{parents.length - 1}"
        end
      end
    end

    def num_checked(article)
      html.span do
        i(class: 'fa fa-check-square-o'){}
        span do
          "#{article.num_checked}/#{parents.length - 1}"
        end
      end
    end
  end
end
