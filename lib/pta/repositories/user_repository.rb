require 'lotus/repository'

class UserRepository
  include Lotus::Repository

  def self.find_by_login_name(login_name)
    query do
      where(login_name: login_name).
        desc(:id). # 降順（一番新しいのが手前）
        limit(1)   # リストの最初だけ
    end.first      # 配列の最初の要素を返す
  end

  def self.parents
    query do
      where(is_child: 0)
    end.all
  end

  def self.children
    query do
      where(is_child: 1)
    end.all
  end
end
