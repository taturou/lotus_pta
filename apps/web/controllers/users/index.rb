module Web::Controllers::Users
  class Index
    include Web::Action

    expose :children

    def call(params)
      @children = UserRepository.children
    end
  end

  class Show
    include Web::Action

    expose :user

    def call(params)
      @user = UserRepository.find(params[:id])
      halt 404 unless @user
    end
  end
end
