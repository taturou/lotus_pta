UserRepository.clear

# Data is created by 「なんちゃって個人情報」(http://kazina.com/dummy/index.html)
[
  [{nickname: "城戸さん", last_name: "城戸", first_name: "路子",   last_name_ruby: "きど",     first_name_ruby: "みちこ",     email: "kido_michiko@example.com",     phone: "080-9413-4937"},
   {nickname: "城戸さん", last_name: "城戸", first_name: "妃里",   last_name_ruby: "きど",     first_name_ruby: "ゆり"}],
  [{nickname: "久米さん", last_name: "久米", first_name: "勇一",   last_name_ruby: "くめ",     first_name_ruby: "ゆういち",   email: "kume_yuuichi@example.com",     phone: "080-4511-6580"},
   {nickname: "久米さん", last_name: "久米", first_name: "真吾",   last_name_ruby: "くめ",     first_name_ruby: "しんご"}],
  [{nickname: "角田さん", last_name: "角田", first_name: "未來",   last_name_ruby: "かどた",   first_name_ruby: "みらい",     email: "kadota_mirai@example.com",     phone: "090-0286-6532"},
   {nickname: "角田さん", last_name: "角田", first_name: "なつみ", last_name_ruby: "かどた",   first_name_ruby: "なつみ"}],
  [{nickname: "吉沢さん", last_name: "吉沢", first_name: "あさみ", last_name_ruby: "よしざわ", first_name_ruby: "あさみ",     email: "yoshizawa_asami@example.com",  phone: "090-3594-1220"},
   {nickname: "吉沢さん", last_name: "吉沢", first_name: "龍吉",   last_name_ruby: "よしざわ", first_name_ruby: "りゅうきち"}],
  [{nickname: "小沼さん", last_name: "小沼", first_name: "友以乃", last_name_ruby: "こぬま",   first_name_ruby: "ゆいの",     email: "konuma_yuino@example.com",     phone: "090-9921-8880"},
   {nickname: "小沼さん", last_name: "小沼", first_name: "ひかり", last_name_ruby: "こぬま",   first_name_ruby: "ひかり"}],
  [{nickname: "大庭さん", last_name: "大庭", first_name: "由宇",   last_name_ruby: "おおにわ", first_name_ruby: "ゆう",       email: "ooniwa_yuu@example.com",       phone: "080-5758-7585"},
   {nickname: "大庭さん", last_name: "大庭", first_name: "莉沙",   last_name_ruby: "おおにわ", first_name_ruby: "りさ"}],
  [{nickname: "藤木さん", last_name: "藤木", first_name: "豊",     last_name_ruby: "ふじき",   first_name_ruby: "ゆたか",     email: "fujiki_yutaka@example.com",    phone: "080-8231-6440"},
   {nickname: "藤木さん", last_name: "藤木", first_name: "光洋",   last_name_ruby: "ふじき",   first_name_ruby: "みつひろ"}],
  [{nickname: "細野さん", last_name: "細野", first_name: "俊介",   last_name_ruby: "ほその",   first_name_ruby: "しゅんすけ", email: "hosono_shunsuke@example.com",  phone: "090-3473-2983"},
   {nickname: "細野さん", last_name: "細野", first_name: "龍吉",   last_name_ruby: "ほその",   first_name_ruby: "りゅうきち"}],
  [{nickname: "三宅さん", last_name: "三宅", first_name: "英嗣",   last_name_ruby: "みやけ",   first_name_ruby: "ひでつぐ",   email: "miyake_hidetsugu@example.com", phone: "090-6212-3842"},
   {nickname: "三宅さん", last_name: "三宅", first_name: "龍吉",   last_name_ruby: "みやけ",   first_name_ruby: "りゅうきち"}],
  [{nickname: "藤岡さん", last_name: "藤岡", first_name: "えみ",   last_name_ruby: "ふじおか", first_name_ruby: "えみ",       email: "fujioka_emi@example.com",      phone: "080-1415-2127"},
   {nickname: "藤岡さん", last_name: "藤岡", first_name: "陽介",   last_name_ruby: "ふじおか", first_name_ruby: "ようすけ"}],
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

