module Web::Controllers::Users
  class Index
    include Web::Action

    expose :login_user
    expose :children

    def call(params)
      @login_user = UserRepository.find_by_login_name(params.env['REMOTE_USER'])
      halt 401 unless @login_user

      @children = UserRepository.children
    end
  end
end
