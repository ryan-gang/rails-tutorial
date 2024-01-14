# rvm get stable
# rvm install 3.1.2
rvm --default use 3.1.2
# echo "gem: --no-document" >> ~/.gemrc
gem install rails -v 7.0.4
gem install bundler -v 2.3.14
bundle _2.3.14_ config set --local without 'production'
bundle _2.3.14_ install
# bundle _2.3.14_ update