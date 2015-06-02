UserRepository.clear

[
  [{nickname: "mother1", first_name: "mother1_first", first_name_ruby: "mother1_first_ruby", last_name: "mother1_last", last_name_ruby: "mother1_last_ruby", phone: "111-1111-1111", email: "alfa@example.com"},
   {nickname: "child1", first_name: "child1_first", first_name_ruby: "child1_first_ruby", last_name: "child1_last", last_name_ruby: "child1_last_ruby"},],
  [{nickname: "mother2", first_name: "mother2_first", first_name_ruby: "mother2_first_ruby", last_name: "mother2_last", last_name_ruby: "mother2_last_ruby", phone: "222-2222-2222", email: "alfa@example.com"},
   {nickname: "child2", first_name: "child2_first", first_name_ruby: "child2_first_ruby", last_name: "child2_last", last_name_ruby: "child2_last_ruby"},],
  [{nickname: "mother3", first_name: "mother3_first", first_name_ruby: "mother3_first_ruby", last_name: "mother3_last", last_name_ruby: "mother3_last_ruby", phone: "333-3333-3333", email: "alfa@example.com"},
   {nickname: "child3", first_name: "child3_first", first_name_ruby: "child3_first_ruby", last_name: "child3_last", last_name_ruby: "child3_last_ruby"},],
].each do |user_attrs|
  mother = User.new(user_attrs[0])
  UserRepository.persist(mother)
  child = User.new(user_attrs[1])
  child.child!
  child.mother = UserRepository.find_by_nickname(mother.nickname)
  UserRepository.persist(child)
end

[
  {title: 'title1', content: 'content1'},
  {title: 'タイトル2', content: '記事2'},
].each do |article_attrs|
  article = Article.new(article_attrs)
  article.user = UserRepository.find(1)
  ArticleRepository.persist(article)
end

