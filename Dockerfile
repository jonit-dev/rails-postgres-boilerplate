FROM ruby:2.6.3

ENV BUNDLER_VERSION=2.2.1

# install system level dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm

RUN npm install -g yarn
  
WORKDIR /myapp

# Install project gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.1
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . /myapp

# Add a script to be executed every time the container starts.
COPY ./docker-entrypoints/entrypoint.sh /usr/bin/myapp/docker-entrypoints/
RUN chmod +x /usr/bin/myapp/docker-entrypoints/entrypoint.sh

ENTRYPOINT ["./docker-entrypoints/entrypoint.sh"]

EXPOSE 3000


# install JS dependencies
COPY package.json yarn.lock ./
RUN yarn install --check-files


COPY . ./

ENTRYPOINT [ "./docker-entrypoints/entrypoint.sh" ]