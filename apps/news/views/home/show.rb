module News::Views::Home
  class Show
    include News::View
    include Lotus::Helpers

    def submit_form
      if submitted?
        "(確認済み)"
      else
        html.form(action: "/news/#{params['md5']}/submit", method: 'get') do
          input type: 'submit', value: '確認しました'
        end
      end
    end

    private

    def submitted?
      logs = article.logs.clone
      logs.delete_if do |log|
        (log.user.id != user.id) || (log.kind != Log::KIND_SUBMIT)
      end
      logs.length > 0
    end
  end
end
