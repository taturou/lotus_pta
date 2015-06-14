collection :homerooms do
  entity     Homeroom
  repository HomeroomRepository

  attribute :id,    Integer
  attribute :name,  String
  attribute :grade, String
end

collection :users do
  entity     User
  repository UserRepository

  attribute :id,                Integer
  attribute :login_name,        String
  attribute :passwd_hash,       String
  attribute :is_admin,          Integer
  attribute :first_name,        String
  attribute :first_name_ruby,   String
  attribute :last_name,         String
  attribute :last_name_ruby,    String
  attribute :birthday,          DateTime
  attribute :phone,             String
  attribute :email,             String
  attribute :is_child,          Integer
  attribute :father_user_id,    Integer
  attribute :mother_user_id,    Integer
  attribute :homeroom_id,       Integer
end

collection :articles do
  entity     Article
  repository ArticleRepository

  attribute :id,                Integer
  attribute :title,             String
  attribute :content,           String
  attribute :owner_user_id,     Integer
  attribute :created_at,        DateTime
end

collection :logs do
  entity     Log
  repository LogRepository

  attribute :id,                Integer
  attribute :http_client_ip,    String
  attribute :http_user_agent,   String
  attribute :kind,              Integer
  attribute :reader_user_id,    Integer
  attribute :article_id,        Integer
  attribute :accessed_at,       DateTime
end

collection :spectators do
  entity     Spectator
  repository SpectatorRepository

  attribute :id,                Integer
  attribute :article_id,        Integer
  attribute :reader_user_id,    Integer
  attribute :created_at,        DateTime
  attribute :md5,               String
end
