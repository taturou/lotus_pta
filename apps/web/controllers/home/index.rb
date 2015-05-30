module Pta::Controllers::Home
  class Index
    include Pta::Action

    expose :time

    def call(params)
      @time = Time.now
    end
  end
end
