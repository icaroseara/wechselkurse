FROM ruby:2.2.3

MAINTAINER Icaro Seara icaro.seara@gmail.com

ENV APP_HOME /wechselkurse/
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
RUN bundle install

VOLUME .:$APP_HOME

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
