require 'lotus/entity'

class User
  include Lotus::Entity
  attributes :login_name, :passwd_hash, :is_admin, :first_name, :first_name_ruby, :last_name, :last_name_ruby, :birthday, :phone, :email, :is_child, :father_user_id, :mother_user_id, :homeroom_id # :id is implicit

  def fullname
    "#{last_name} #{first_name}"
  end

  def fullname_ruby
    "#{last_name_ruby} #{first_name_ruby}"
  end

  def admin?
    is_admin == 1 ? true : false
  end

  def child?
    is_child == 1 ? true : false
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

  def homeroom=(homeroom)
    self.homeroom_id = homeroom.id
  end

  def homeroom
    @homeroom ||= HomeroomRepository.find(homeroom_id)
  end

  def articles_query(desc = true)
    query = ArticleRepository.query_by_owner(self)
    query = query.desc(:id) if desc
  end

  def logs_query(desc = true)
    query = LogRepository.query_by_reader(self)
    query = query.desc(:id) if desc
  end
end
