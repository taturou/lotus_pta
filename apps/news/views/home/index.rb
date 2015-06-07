module News::Views::Home
  class Show
    include News::View

    def submitted?
      logs = logs_as_article(user, article)
      logs.delete_if do |log|
        log.kind != Log::KIND_SUBMIT
      end
      logs.length > 0
    end

    private

    def logs_as_article(user, article)
      logs = article.logs.clone
      logs.delete_if do |log|
        log.user.id != user.id
      end
      logs
    end
  end

  class Submit
    include News::View
  end
end
