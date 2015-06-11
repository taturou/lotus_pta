module Web::Controllers::Users
  class Show
    include Web::Action

    expose :login_user
    expose :user, :parents

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @user = UserRepository.find(params[:id])
      halt 404 unless @user

      @parents = UserRepository.parents
    end
  end
end
