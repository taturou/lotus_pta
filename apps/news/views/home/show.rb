module News::Views::Home
  class Show
    include News::View
    include Lotus::Helpers

    def submit_form
      if submitted?
        "(#{ t('news.confirmded') })"
      else
        html.form(action: "/news/#{params['md5']}/submit", method: 'get') do
          input type: 'submit', value: t('news.confirm')
        end
      end
    end

    private

    def submitted?
      logs = article.logs_query.all
      logs.delete_if do |log|
        (log.reader.id != reader.id) || (log.kind != Log::KIND_SUBMIT)
      end
      logs.length > 0
    end
  end
end
