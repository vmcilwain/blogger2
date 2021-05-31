FROM ruby:2.6.6

LABEL org.opencontainers.image.authors="lovell.mcilwain@gmail.com"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y  build-essential imagemagick software-properties-common default-jdk nodejs npm apt-utils yarn && \ 
    # --no-install-recommends
    # openssh-client unattended-upgrades 
    # gnupg2 libjemalloc-dev redis-server
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    gem install mailcatcher && \
    gem install bundler
    
RUN mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

RUN yarn --check-files

EXPOSE 3000

# CMD ["bundle", "exec", "rails", 's', "-b", "0.0.0.0"]
CMD ["bundle", "exec", "rdebug-ide",  "--host", "0.0.0.0", "--port", "1234", "--",  "rails", 's', "-b", "0.0.0.0"]