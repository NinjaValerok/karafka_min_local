FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y build-essential libvips pkg-config
WORKDIR /app

RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bundle", "exec", "karafka", "server"]
