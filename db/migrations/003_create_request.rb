class CreateRequests < Sequel::Migration
  def up
    create_table :requests do
      primary_key :id
      String :http_client_ip
      String :http_user_agent
      Integer :spectator_id
      index :spectator_id
      datetime :requested_at, default: Time.now
    end
  end

  def down
    drop_table :requests
  end
end
