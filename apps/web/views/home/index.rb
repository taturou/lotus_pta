module Web::Views::Home
  class Index
    include Web::View

    def breadcrumbs
      breadcrumbs_base([{icon: 'fa-home'}])
    end
  end
end
