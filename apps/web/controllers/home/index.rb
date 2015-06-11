module Web::Controllers::Home
  class Index
    include Web::Action

    expose :login_user

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user
    end
  end
end
