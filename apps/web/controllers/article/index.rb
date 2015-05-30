module Pta::Controllers::Article
  class Index
    include Pta::Action

    def call(params)
    end
  end

  class Show
    include Pta::Action

    expose :id

    def call(params)
      @id = params[:id]
    end
  end
end
