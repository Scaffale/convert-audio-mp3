FROM ruby:3.1.0
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg
RUN gem install parallel
ADD . .
WORKDIR .
RUN mkdir converted
RUN mkdir to_convert
ENTRYPOINT ["ruby", "converter.rb"]
