class CreateHomerooms < Sequel::Migration
  def up
    create_table :homerooms do
      primary_key :id
      String :name
      String :grade
    end
  end

  def down
    drop_table :homerooms
  end
end
