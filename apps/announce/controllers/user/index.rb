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
      if params[:id]
        @user = UserRepository.find(params[:id])
      elsif params[:name]
        @user = UserRepository.find_by_name(params[:name])
      else
        @user = nil
      end
    end
  end
end
