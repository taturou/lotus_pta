require 'lotus/entity'

class User
  include Lotus::Entity
  attributes :nickname, :first_name, :first_name_ruby, :last_name, :last_name_ruby, :phone, :email, :is_child, :father_user_id, :mother_user_id # :id is implicit

  def child?
    !!is_child
  end

  def child!
    self.is_child = 1
  end

  def children
    def UserRepository.find_children(parent)
      query do
        where(father_user_id: parent.id).or(mother_user_id: parent.id)
      end
    end

    UserRepository.find_children(self).all
  end

  def father=(user)
    self.father_user_id = user.id
  end

  def father
    @father ||= UserRepository.find(father_user_id)
  end

  def mother=(user)
    self.mother_user_id = user.id
  end

  def mother
    @mother ||= UserRepository.find(mother_user_id)
  end

  def logs(desc = true, limit = 0)
    return @logs if @logs

    query = LogRepository.array_by_user(self)
    query = query.desc(:id) if desc
    query = query.limit(limit) if limit > 0
    @logs = query.all
    @logs.delete_if do |log|
      log.article == nil
    end
  end
end
