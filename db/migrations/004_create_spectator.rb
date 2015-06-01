class CreateSpectator < Sequel::Migration
  def up
    create_table :spectators do
      primary_key :id
      Integer :article_id
      Integer :user_id
      datetime :created_at
      String :md5
    end
  end

  def down
    drop_table :spectators
  end
end
