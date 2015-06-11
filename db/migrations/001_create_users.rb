class CreateUsers < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      String :login_name
      String :passwd_hash
      String :first_name
      String :first_name_ruby
      String :last_name
      String :last_name_ruby
      datetime :birthday
      String :phone
      String :email
      Integer :is_child, default: 0
      Integer :father_user_id
      index :father_user_id
      Integer :mother_user_id
      index :mother_user_id
      Integer :homeroom_id
      index :homeroom_id
    end
  end

  def down
    drop_table :users
  end
end
