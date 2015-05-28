module Announce::Views::Home
  class Index
    include Announce::View

    def hoge
      time.strftime("%Y-%m-%d %a %H:%M:%S")
    end
  end
end
