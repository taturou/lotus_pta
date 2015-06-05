collection :users do
  entity     User
  repository UserRepository

  attribute :id,                Integer
  attribute :nickname,          String
  attribute :first_name,        String
  attribute :first_name_ruby,   String
  attribute :last_name,         String
  attribute :last_name_ruby,    String
  attribute :phone,             String
  attribute :email,             String
  attribute :is_child,          Integer
  attribute :father_user_id,    Integer
  attribute :mother_user_id,    Integer
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

collection :logs do
  entity     Log
  repository LogRepository

  attribute :id,              Integer
  attribute :http_client_ip,  String
  attribute :http_user_agent, String
  attribute :spectator_id,    Integer
  attribute :accessed_at,     DateTime
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
