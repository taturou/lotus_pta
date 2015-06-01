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

