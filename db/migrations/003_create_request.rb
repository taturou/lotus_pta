class CreateRequests < Sequel::Migration
  def up
    create_table :requests do
      primary_key :id
      String :http_client_ip
      String :http_user_agent
      Integer :user_id
      index :user_id
      Integer :article_id
      index :article_id
      datetime :requested_at, default: Time.now
    end
  end

  def down
    drop_table :requests
  end
end
