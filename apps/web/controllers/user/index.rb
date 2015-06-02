module Web::Controllers::User
  class Index
    include Web::Action

    expose :users

    def call(params)
      @users = UserRepository.all
    end
  end

  class Show
    include Web::Action

    expose :user, :requests

    def call(params)
      if params[:id]
        @user = UserRepository.find(params[:id])
      elsif params[:name]
        @user = UserRepository.find_by_name(params[:name])
      else
        @user = nil
      end
      halt 404 unless @user

      @requests = RequestRepository.array_by_user(@user).desc(:id).limit(5).all
    end
  end
end
