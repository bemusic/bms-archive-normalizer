FROM ruby:2.4.1

# Install p7zip and sox
RUN apt-get update \
	&& apt-get install -y \
    p7zip-full \
    p7zip-rar \
    sox \
    libsox-fmt-mp3 \
	&& rm -rf /var/lib/apt/lists/* \

# Throw error if Gemfile.lock unconsistent
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install
