module Pta::Views::Article
  class Index
    include Pta::View

  end

  class Show
    include Pta::View

    def already_read?(user)
      index = requests.index do |request|
        request.user.id == user.id
      end
      index != nil
    end
  end
end
