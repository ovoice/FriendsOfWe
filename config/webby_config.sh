#this is used when deploying to the webbynode staging server.
#only run on redeployment of node (not app redeployment via capistrano)

# edit opt/nginx/conf/nginx.conf to specific the root dir of your app
# restart passanger using: touch #{current_path}/tmp/restart.txt
# restart nginx using  etc/init.d/nginx restart

sudo apt-get install imagemagick
sudo apt-get install zip
sudo apt-get install locate
sudo apt-get install htop

gem sources -a http://gems.github.com
gem sources -a http://gems.rubyforge.org
gem sources -a http://gemcutter.org
gem install gemcutter
# Assembles Rails database.yml based on information
# provided from a ReadyStack redeploy
 
echo "
production:
  adapter: mysql
  database: friendsofwe_production
  username: friendsofwe
  host: localhost
  encoding: utf8
  password: UPDATEPASSWORD
" >> config/database.yml

echo "gem: --no-ri --no-rdoc" >> ~/.gemrc



#mysql -u DBUSER -p -h localhost DBNAME < file.sql
rake gems:install

