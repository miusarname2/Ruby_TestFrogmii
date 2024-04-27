# Define the base image with Ruby 3.1.2
FROM ruby:3.1.2

# Set working directory inside the container
WORKDIR /app

RUN pwd

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    nodejs \
    git

# Clone the Ruby_TestFrogmii project
RUN git clone https://github.com/miusarname2/Ruby_TestFrogmii.git . && ls


# Install gems
RUN gem install bundler && bundle install

# Run database migrations
RUN rails db:migrate

# Expose port 3000
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
