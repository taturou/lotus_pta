module Announce::Controllers::Home
  class Index
    include Announce::Action

    expose :time

    def call(params)
      @time = Time.now
    end
  end
end
