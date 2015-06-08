module Web::Controllers::Users
  class Index
    include Web::Action

    expose :children

    def call(params)
      @children = UserRepository.children
    end
  end
end
