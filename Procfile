redis:		redis-server
db:			su - postgres -c "/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf"
nginx:		/usr/sbin/nginx -c /etc/nginx/nginx.conf
puma:	bundle exec rake db:migrate && bundle exec rake db:seed_env && bundle exec rake db:seed && bundle exec rake air_shop:load_routes && bundle exec puma -C /app/config/puma.rb -e remotestaging
