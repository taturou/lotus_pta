module Web::Views::Articles
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
end
