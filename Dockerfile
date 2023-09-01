FROM ruby:3.1.4

RUN mkdir app
WORKDIR /app

RUN gem install webrick
RUN echo "living for today" > index.html

# In Ruby's executed Python below -> python3 -m http.server 3456
CMD ruby -r webrick -e 'WEBrick::HTTPServer.new(:Port => 3456, :DocumentRoot => "/app").start'