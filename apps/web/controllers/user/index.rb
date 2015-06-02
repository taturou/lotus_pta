module Web::Controllers::User
  class Index
    include Web::Action

    expose :children

    def call(params)
      @children = UserRepository.children
    end
  end

  class Show
    include Web::Action

    expose :user, :requests

    def call(params)
      @user = UserRepository.find(params[:id])
      halt 404 unless @user

      @requests = RequestRepository.array_by_user(@user).desc(:id).limit(5).all
    end
  end
end
