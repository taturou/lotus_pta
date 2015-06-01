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

collection :requests do
  entity     Request
  repository RequestRepository

  attribute :id,              Integer
  attribute :http_client_ip,  String
  attribute :http_user_agent, String
  attribute :spectator_id,    Integer
  attribute :requested_at,    DateTime
end

collection :spectators do
  entity     Spectator
  repository SpectatorRepository

  attribute :id,            Integer
  attribute :article_id,    Integer
  attribute :user_id,       Integer
  attribute :created_at,    DateTime
  attribute :md5,           String
end
