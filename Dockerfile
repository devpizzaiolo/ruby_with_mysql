# syntax=docker/dockerfile:1
FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y nodejs

# Install dependencies
#RUN apt-get update && apt-get install -qq -y build-essential nodejs npm && apt-get install -qq -y zip

# Create app directory
ENV RAILS_ENV=development
RUN mkdir -p /myapp
RUN mkdir -p log
RUN touch $RAILS_ENV.log


WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.3.12
RUN gem install mysql2 --platform=ruby -- --with-mysql-lib="C:\wamp64\bin\mysql\mysql8.0.18"
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]