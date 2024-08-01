FROM ruby:3.3.4

RUN bundle config --global frozen 1

RUN gem install bundler

COPY . .

RUN bundle install

CMD ["ruby", "api.rb", "-o", "0.0.0.0", "-p", "4567"]