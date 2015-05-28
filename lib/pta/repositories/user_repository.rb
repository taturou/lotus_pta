require 'lotus/repository'

class UserRepository
  include Lotus::Repository

  def self.find_by_name(name)
    query do
      where(name: name).    # 名前が name
        desc(:id).          # 降順（一番新しいのが手前）
        limit(1)            # リストの最初だけ
    end.first               # 配列の最初の要素を返す
  end
end
