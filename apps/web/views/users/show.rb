module Web::Views::Users
  class Show
    include Web::View

    def breadcrumbs
      breadcrumbs_base(
        [
          {icon: 'fa-home', url: routes.path(:home)},
          {icon: 'fa-list-alt', url: routes.path(:users)},
          {icon: 'fa-user'}
        ])
    end
  end
end
