module Web::Controllers::Home
  class Index
    include Web::Action

    expose :time

    def call(params)
      @time = Time.now
    end
  end
end
