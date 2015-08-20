#redis:		redis-server
#db:			su - postgres -c "/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf"
#nginx:		/usr/sbin/nginx -c /etc/nginx/nginx.conf
#puma:	bundle exec rake db:migrate && bundle exec rake db:seed && bundle exec rake assets:precompile -e production  && bundle exec puma  -e production
web: bundle exec puma --config config/puma.rb
