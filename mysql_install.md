# MySQL install command for windows

bundle install した後に順番に実行  

1. bundle exec gem install mysql2 --platform=ruby -- '--no-vendor-libmysql --with-mysql-dir="C:/Program Files/MySQL/MySQL Connector C 6.1"'
2. bundle exec gem uninstall mysql2 を実行し "mysql2-0.4.10-x64-mingw32" を消す
3. ruby.exe と同じフォルダに libmysql.dll(C:\Program Files\MySQL\MySQL Connector C 6.1\lib) を置く

※注意 GemFileの中のmysql2は消しちゃダメ  
[※参考URL](http://itmemo.net-luck.com/windows-rails-environment-2/)
