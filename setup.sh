#!/bin/bash
echo "Setup Lotus-PTA"
bundle install --path .bundle
bundle exec rake db:migrate
bundle exec rake db:seed
