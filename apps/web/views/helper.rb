module Web::View
  def initialize
    super
  end

  # パンくずリスト
  def breadcrumbs_base(crumbs)
    html.div(class: 'mxn1 mb1 h5') do
      crumbs.each_with_index do |crumb, index|
        if crumb[:url]
          a(href: crumb[:url], class: 'button button-narrow button-transparent blue') do
            i(class: "fa #{crumb[:icon]}"){}
          end
          if (index < (crumbs.length - 1))
            i(class: 'fa fa-angle-right'){}
          end
        else
          span(class: 'button button-narrow button-transparent gray') do
            i(class: "fa #{crumb[:icon]}"){}
          end
          if (index < (crumbs.length - 1))
            i(class: 'fa fa-angle-right'){}
          end
        end
      end
    end
  end
end
