# Use the official Ruby image
FROM ruby:2.7.0

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY ./src/Gemfile ./src/Gemfile.lock /app/

# Install dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY ./src /app/

# Expose the port that Sinatra will run on
EXPOSE 4567

# Command to run the application
CMD ["bundle", "exec", "ruby", "app.rb"]
