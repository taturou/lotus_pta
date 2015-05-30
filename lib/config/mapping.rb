collection :users do
  entity     User
  repository UserRepository

  attribute :id,   Integer
  attribute :name, String
end

collection :articles do
  entity     Article
  repository ArticleRepository

  attribute :id,              Integer
  attribute :title,           String
  attribute :content,         String
  attribute :created_user_id, Integer
  attribute :created_at,      DateTime
end
