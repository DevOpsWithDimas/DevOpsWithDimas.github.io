FROM --platform=amd64 ruby:3.2.2-bullseye
RUN apt update && \
    apt install build-essential ruby-dev -y

RUN gem install bundler && \
    gem install bundle

# WORKDIR /src/apps
# COPY . /src/apps
# RUN mkdir -p /var/www/html
# RUN bundle install && \
#     bundle exec jekyll build -p /var/www/html