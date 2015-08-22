FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

# for postgres gem pg_dump needed by rake db:structure:dump
RUN apt-get install -y postgresql-client-9.4

ENV APP_HOME /opt/air_sched


# Copy the Gemfile and Gemfile.lock into the image. 
# Temporarily set the working directory to where they are. 
WORKDIR /tmp 
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install 

ADD . $APP_HOME
# Set the final working dir to the Rails app's location.
#RUN mkdir -p $APP_HOME/tmp/pids/
WORKDIR $APP_HOME



#CMD bundle exec rake db:setup

#EXPOSE 80
#EXPOSE 3000
