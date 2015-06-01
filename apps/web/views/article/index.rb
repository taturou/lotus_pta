module Web::Views::Article
  class Index
    include Web::View

  end

  class Show
    include Web::View

    def already_read?(user)
      index = requests.index do |request|
        request.user.id == user.id
      end
      index != nil
    end
  end
end
