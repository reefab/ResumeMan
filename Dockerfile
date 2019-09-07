FROM ruby:2.4.7

EXPOSE 4567/tcp
LABEL maintainer="fabien@reefab.net"

RUN mkdir -p /resume/build && mkdir -p /resume/tmp && mkdir -p /resume/vendor
COPY Gemfile Gemfile.lock config.rb makepdf.rb /resume/

RUN useradd -m resumeman && chown -R resumeman /resume

USER resumeman

WORKDIR /resume

RUN bundle install --path /resume/vendor/bundle

ENTRYPOINT ["bundle", "exec", "middleman"]
