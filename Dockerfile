FROM ruby:2.7.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y build-essential nodejs
RUN npm install -g yarn

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.1.4 && bundle install --jobs 20 --retry 5

ENV GEM_HOME /bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_PATH /bundle
ENV BUNDLE_BIN /bundle/bin

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3000
