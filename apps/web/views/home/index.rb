module Pta::Views::Home
  class Index
    include Pta::View

    def hoge
      time.strftime("%Y-%m-%d %a %H:%M:%S")
    end
  end
end
