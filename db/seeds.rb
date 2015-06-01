UserRepository.clear

[
  {name: 'Alfa'},
  {name: 'Bravo'},
  {name: 'Charlie'},
].each do |user_attrs|
  user = User.new(user_attrs)
  UserRepository.persist(user)
end

[
  {title: 'title1', content: 'content1'},
  {title: 'タイトル2', content: '記事2'},
].each do |article_attrs|
  article = Article.new(article_attrs)
  article.user = UserRepository.find(1)
  ArticleRepository.persist(article)
end

[
  {http_client_ip: '122.30.150.233', http_user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36'},
  {http_client_ip: '126.205.7.228', http_user_agent: 'Mozilla/5.0 (iPhone: CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F70 Safari/600.1.4'},
].each do |request_attrs|
  request = Request.new(request_attrs)
  request.user = UserRepository.find(2)
  request.article = ArticleRepository.find(1)
  RequestRepository.persist(request)
end
