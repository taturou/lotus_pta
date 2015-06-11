module Web::Controllers::Users
  class Show
    include Web::Action

    expose :user, :parents

    def call(params)
      @user = UserRepository.find(params[:id])
      halt 404 unless @user

      @parents = UserRepository.parents
    end
  end
end
