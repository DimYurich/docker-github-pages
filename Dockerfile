FROM ruby:2.3.2-alpine
MAINTAINER dmitry.yu.terentyev@gmail.com

# ruby-dev libffi-dev
RUN apk update && apk add --no-cache build-base && \
		gem install github-pages  \
		#gem install jekyll-github-metadata && \
		apk del build-base && \
		mkdir /site

VOLUME /site
EXPOSE 4000

WORKDIR /site
ENTRYPOINT ["jekyll"]
CMD ["serve", "--watch", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]
