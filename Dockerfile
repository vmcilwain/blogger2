FROM ruby:2.6.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends imagemagick software-properties-common default-jdk nodejs npm apt-utils openssh-client unattended-upgrades yarn && \ 
    # gnupg2 libjemalloc-dev redis-server
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    gem install mailcatcher && \
    gem install bundler && \
    mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install && yarn --check-files

COPY entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]

# CMD ["bundle", "exec", "rails", 's', "-b", "0.0.0.0"]
CMD ["bundle", "exec", "rdebug-ide",  "--host", "0.0.0.0", "--port", "1234", "--",  "rails", 's', "-b", "0.0.0.0"]