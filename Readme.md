# PTA

## setup

    $ git --version
    git version 2.3.2 (Apple Git-55)

    $ ruby -v
    ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]

## install

    $ git clone https://github.com/taturou/lotus_pta.git
    $ cd lotus_pta
    $ bundle install --path .bundle
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed

## execute

    $ ./lotus server
    [2015-05-01 00:00:00] INFO  WEBrick 1.3.1
    [2015-05-01 00:00:00] INFO  ruby 2.2.2 (2015-04-13) [x86_64-darwin14]
    [2015-05-01 00:00:00] INFO  WEBrick::HTTPServer#start: pid=48217 port=2300


