class CreateArticles < Sequel::Migration
  def up
    create_table :articles do
      primary_key :id
      String :title
      String :content
      Integer :owner_user_id
      index :owner_user_id
      datetime :created_at, default: Time.now
    end
  end

  def down
    drop_table :articles
  end
end
