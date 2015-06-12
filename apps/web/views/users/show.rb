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

    def checked(article)
      if article.num_checked >= (parents.length - 1)
        html.i(class: 'fa fa-check-circle-o'){}
      else
        html.i(class: 'fa fa-circle-o'){}
      end
    end
  end
end
