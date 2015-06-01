module News::Controllers::Home
  class Index
    include News::Action

    expose :time

    def call(params)
      @time = Time.now
    end
  end
end
