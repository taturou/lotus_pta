module Announce::Controllers::User
  class Index
    include Announce::Action

    expose :users

    def call(params)
      @users = UserRepository.all
    end
  end

  class Show
    include Announce::Action

    expose :user

    def call(params)
      @user = UserRepository.find(params[:id])
    end
  end
end
