FROM ruby:2.6.6

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /webapp

WORKDIR /webapp

ENV APP_ROOT /webapp

COPY ./Gemfile $APP_ROOT/Gemfile

COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

COPY ./ APP_ROOT

# tmpファイルは.gitignoreに含まれているので作成する必要あり
EXPOSE 3000
CMD ["rails", "s"]
