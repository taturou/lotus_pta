require 'rack/auth/digest/md5'
DIGEST_REALM="Lotus-PTA"

UserRepository.clear

# Data is created by 「なんちゃって個人情報」(http://kazina.com/dummy/index.html)
[
  [{login_name: "m-kido",      last_name: "城戸", first_name: "路子",   last_name_ruby: "きど",     first_name_ruby: "みちこ",     email: "kido_michiko@example.com",     phone: "080-9413-4937"},
   {login_name: "y-kido",      last_name: "城戸", first_name: "妃里",   last_name_ruby: "きど",     first_name_ruby: "ゆり"}],
  [{login_name: "y-kume",      last_name: "久米", first_name: "勇一",   last_name_ruby: "くめ",     first_name_ruby: "ゆういち",   email: "kume_yuuichi@example.com",     phone: "080-4511-6580"},
   {login_name: "s-kume",      last_name: "久米", first_name: "真吾",   last_name_ruby: "くめ",     first_name_ruby: "しんご"}],
  [{login_name: "m-kadota",    last_name: "角田", first_name: "未來",   last_name_ruby: "かどた",   first_name_ruby: "みらい",     email: "kadota_mirai@example.com",     phone: "090-0286-6532"},
   {login_name: "n-kadota",    last_name: "角田", first_name: "なつみ", last_name_ruby: "かどた",   first_name_ruby: "なつみ"}],
  [{login_name: "a-yoshizawa", last_name: "吉沢", first_name: "あさみ", last_name_ruby: "よしざわ", first_name_ruby: "あさみ",     email: "yoshizawa_asami@example.com",  phone: "090-3594-1220"},
   {login_name: "y-yoshizawa", last_name: "吉沢", first_name: "龍吉",   last_name_ruby: "よしざわ", first_name_ruby: "りゅうきち"}],
  [{login_name: "y-konuma",    last_name: "小沼", first_name: "友以乃", last_name_ruby: "こぬま",   first_name_ruby: "ゆいの",     email: "konuma_yuino@example.com",     phone: "090-9921-8880"},
   {login_name: "h-konuma",    last_name: "小沼", first_name: "ひかり", last_name_ruby: "こぬま",   first_name_ruby: "ひかり"}],
  [{login_name: "y-ohniwa",    last_name: "大庭", first_name: "由宇",   last_name_ruby: "おおにわ", first_name_ruby: "ゆう",       email: "ooniwa_yuu@example.com",       phone: "080-5758-7585"},
   {login_name: "r-ohniwa",    last_name: "大庭", first_name: "莉沙",   last_name_ruby: "おおにわ", first_name_ruby: "りさ"}],
  [{login_name: "y-fujiki",    last_name: "藤木", first_name: "豊",     last_name_ruby: "ふじき",   first_name_ruby: "ゆたか",     email: "fujiki_yutaka@example.com",    phone: "080-8231-6440"},
   {login_name: "m-fujiki",    last_name: "藤木", first_name: "光洋",   last_name_ruby: "ふじき",   first_name_ruby: "みつひろ"}],
  [{login_name: "s-hosono",    last_name: "細野", first_name: "俊介",   last_name_ruby: "ほその",   first_name_ruby: "しゅんすけ", email: "hosono_shunsuke@example.com",  phone: "090-3473-2983"},
   {login_name: "r-hosono",    last_name: "細野", first_name: "龍吉",   last_name_ruby: "ほその",   first_name_ruby: "りゅうきち"}],
  [{login_name: "h-miyake",    last_name: "三宅", first_name: "英嗣",   last_name_ruby: "みやけ",   first_name_ruby: "ひでつぐ",   email: "miyake_hidetsugu@example.com", phone: "090-6212-3842"},
   {login_name: "r-miyake",    last_name: "三宅", first_name: "龍吉",   last_name_ruby: "みやけ",   first_name_ruby: "りゅうきち"}],
  [{login_name: "e-fujioka",   last_name: "藤岡", first_name: "えみ",   last_name_ruby: "ふじおか", first_name_ruby: "えみ",       email: "fujioka_emi@example.com",      phone: "080-1415-2127"},
   {login_name: "y-fujioka",   last_name: "藤岡", first_name: "陽介",   last_name_ruby: "ふじおか", first_name_ruby: "ようすけ"}],
].each do |user_attrs|
  mother = User.new(user_attrs[0])
  mother.passwd_hash = Digest::MD5.new.update('%s:%s:%s' % [mother.login_name, DIGEST_REALM, mother.login_name])
  UserRepository.persist(mother)

  child = User.new(user_attrs[1])
  child.passwd_hash = Digest::MD5.new.update('%s:%s:%s' % [child.login_name, DIGEST_REALM, child.login_name])
  child.child!
  child.mother = UserRepository.find_by_login_name(mother.login_name)
  UserRepository.persist(child)
end

[
  {title: '宮沢賢治「セロ弾きのゴーシュ」',
   content: '猫もかっこうの病気赤屋が嵐でどなりゴーシュませで。またちょっと愉快ますたという扉ました。変ますたのましもですすると裏の下手団のところをはなんだか生意気だろなくて、そこまでセロをあるられことですだ。

ばっ過ぎわたしはホールをいいたていっぺんのセロの水車げをぶっつけ第三セロがいのかっこうへしがやっなまし。室もこんどどなりてはじめまし。

楽長も六給え狩りのようがこわているで。ねずみは長椅子からだたりそれよりとらてだしござい。間はかっこうをまたにやり直しんでかっこうの窓のようからありが子を食っがもう先生へ許しがいるでし。ぱっとそっと楽長を先生に向けたた。'},
  {title: '夏目漱石「私の個人主義」',
   content: 'わくは窓のかっこうおっかさんあたりに小屋へひるあとなた。いやすこしいやましないとかいう下まします。だめだろないものましもたそして評判の俄あたりのままをもどうしても生意気んたて、何なんてねずみをぶっつかっれんました。

思っすぎ私は控室をうるさいますと前のいっしょの口館がひらい第六顔会のおじぎをわからているた。裏も前しがいだ。

交響楽は十きギウギウのようにありてきず。糸は晩先生やぼくを鳴らしてだしまし。音楽も外にまだについてゴーシュが裏のようをふりまわして兵隊を弾いてふらふらゴーシュからしているう。もうなんだか晩をゃくしゃしていましたがいつまでもつづけてへ思うましませ。それすこしに曲が戻ってからだからわからうだ。

窓をあるたな。「猫が教わっない。町はずれ、おまえを眼。弾い。」何ははじめのなかのまたさっきの中がひきたまし。'},
].each do |article_attrs|
  article = Article.new(article_attrs)
  article.owner = UserRepository.find(1)
  ArticleRepository.persist(article)
end

