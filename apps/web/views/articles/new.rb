module Web::Views::Articles
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
end
