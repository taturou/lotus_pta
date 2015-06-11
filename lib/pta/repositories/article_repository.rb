require 'lotus/repository'

class ArticleRepository
  include Lotus::Repository

  def self.query_by_owner(owner)
    query do
      where(owner_user_id: owner.id)
    end
  end
end
