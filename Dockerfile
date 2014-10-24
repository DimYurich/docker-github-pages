FROM ruby:2.1
MAINTAINER jclagache@gmail.com

RUN gem install github-pages -v 28 \
		therubyracer

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]