FROM ruby:2.3.1

RUN apt-get update -yq
RUN apt-get install -y mysql-client

ENV INSTALL_PATH /home/glexport-test

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* ./

RUN bundle install --path vendor/gems

RUN chown -R 1000 .

COPY . $INSTALL_PATH

RUN chmod +x ./entrypoint.sh
RUN chmod +x ./wait-for-it.sh
RUN cp config/database.docker.yml config/database.yml
RUN cp config/redis.docker.yml config/redis.yml

USER 1000

ENV RAILS_ENV production
ENV RAILS_PORT 3000

EXPOSE 3000

ENTRYPOINT ["./wait-for-it.sh"]
