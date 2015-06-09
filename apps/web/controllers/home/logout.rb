module Web::Controllers::Home
  class Logout
    include Web::Action

    def call(params)
      halt 401
    end
  end
end
