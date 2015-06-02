class CreateUsers < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      String :nickname
      String :first_name
      String :first_name_ruby
      String :last_name
      String :last_name_ruby
      String :phone
      String :email
      Integer :is_child, default: 0
      Integer :father_user_id
      index :father_user_id
      Integer :mother_user_id
      index :mother_user_id
    end
  end

  def down
    drop_table :users
  end
end
