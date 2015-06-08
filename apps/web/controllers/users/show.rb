module Web::Controllers::Users
  class Show
    include Web::Action

    expose :user

    def call(params)
      @user = UserRepository.find(params[:id])
      halt 404 unless @user
    end
  end
end
