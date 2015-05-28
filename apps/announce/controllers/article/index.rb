module Announce::Controllers::Article
  class Index
    include Announce::Action

    def call(params)
    end
  end

  class Show
    include Announce::Action

    expose :id

    def call(params)
      @id = params[:id]
    end
  end
end
