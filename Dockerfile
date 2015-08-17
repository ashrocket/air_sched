FROM ubuntu:14.04
MAINTAINER Ashley Raiteri "ashley@raiteri.net"

WORKDIR /tmp

# Install Rails App
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
ADD vendor/gems /tmp/vendor/gems

ENV RAILS_ENV remotestaging
ENV SECRET_KEY_BASE your_secret_key
RUN echo $GEM_HOME
RUN bundle install
RUN bundle install --binstubs

RUN mkdir /app
WORKDIR /app

##########################
#install redis locally
##########################
ENV REDIS_PORT_6379_TCP_ADDR localhost

##########################
#setup postgres locally
##########################
ENV POSTGRES_VERSION 9.3
ENV POSTGRES_HOST localhost
ENV POSTGRES_DATABASE docker
ENV POSTGRES_USERNAME docker
ENV POSTGRES_PASSWORD docker

RUN mkdir -p /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp
RUN chown postgres /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp
RUN chgrp postgres /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp

USER postgres

RUN /etc/init.d/postgresql start \
    && psql --command "create user docker with password 'docker';" \
    && psql --command "alter role docker superuser createrole createdb;" \
    && psql --command "create database docker owner docker;"

USER root
##########################

ADD . /app
RUN mkdir -p /app/tmp/pids/
#ENV AIR_SCHED_URL "http://0.0.0.0"
#RUN RAILS_ENV=remotestaging bundle exec rake assets:precompile --trace

ADD config/nginx-sites.conf /etc/nginx/sites-enabled/default

CMD foreman start -f Procfile

EXPOSE 80
