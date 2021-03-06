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

    def edit_icon
      if readed? || article.owner != login_user
        html.div(class: 'button button-outline right gray mr1') do
          i(class: 'fa fa-edit')
          span{ t('form.edit') }
        end
      else
        html.a(href: routes.path(:edit_article, id: article.id),
               class: 'button button-outline right blue mr1') do
          i(class: 'fa fa-edit')
          span{ t('form.edit') }
        end
      end
    end

    def delete_icon
      if readed? || article.owner != login_user
        html.div(class: 'button button-outline right gray') do
          i(class: 'fa fa-trash-o')
          span{ t('form.delete') }
        end
      else
        path = routes.path(:article, id: article.id)
        html.div(class: 'button button-outline right blue', id: 'alert') do
          i(class: 'fa fa-trash-o')
          span{ t('form.delete') }
          input(name: 'alert_method', value: 'delete', type: 'hidden')
          input(name: 'alert_action', value: path, type: 'hidden')
          input(name: 'alert_content', value: t('article.deldlg_content'), type: 'hidden')
          input(name: 'alert_button_submit', value: t('article.deldlg_submit'), type: 'hidden')
          input(name: 'alert_button_cancel', value: t('article.deldlg_cancel'), type: 'hidden')
        end
      end
    end

    def read_icon(reader)
      if submitted?(reader)
        html.i(class: 'fa fa-check-square-o')
      elsif opened?(reader)
        html.i(class: 'fa fa-folder-open-o')
      else
        html.i(class: 'fa fa-folder-o')
      end
    end

    def read_date(reader)
      unless opened?(reader)
        html.a(href: routes.path(:link_article, id: article.id, reader_user_id: reader.id)) do
          i(class: 'fa fa-share')
        end
      else
        accessed_at(reader)
      end
    end

    private

    def readed?
      article.logs_query.all.length > 0
    end

    def opened?(reader)
      logs = logs_as_article(reader)
      logs.delete_if do |log|
        log.kind != Log::KIND_OPEN
      end
      logs.length > 0
    end

    def submitted?(reader)
      logs = logs_as_article(reader)
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.length > 0
    end

    def accessed_at(reader)
      logs_as_article(reader).first.accessed_at.mdHM
    end

    def logs_as_article(reader)
      logs = article.logs_query.all
      logs.delete_if do |log|
        log.reader.id != reader.id
      end
    end
  end
end
