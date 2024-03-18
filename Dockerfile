ARG RUBY_VERSION=3.3.0

FROM ruby:$RUBY_VERSION AS rovers_control_app

RUN apt-get update && apt-get upgrade -y

# Configure default PATH
ENV INSTALL_PATH=/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# Copy Gemfile for container
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY input.txt /app/input.txt
COPY output.txt /app/output.txt

# Copy app code for container
COPY . .

# Install dependencies
RUN bundle install

# Running application
CMD ruby processor.rb
