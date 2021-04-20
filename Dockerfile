FROM ruby:3.0.0

RUN apt-get update && apt-get install -qq -y \
    build-essential git nodejs libpq-dev libgit2-dev manpages-dev pkg-config \
    --fix-missing --no-install-recommends
RUN apt-get install -y --no-install-recommends apt-utils

RUN gem install bundler -v 2.2.14 --no-document

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /home/backend
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be run in and is documented
# on Docker's website extensively.
RUN mkdir -p $INSTALL_PATH/tmp/pids
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle check | bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

ENTRYPOINT ["bundle", "exec"]
