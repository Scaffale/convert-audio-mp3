FROM ruby:3.1.0
LABEL maintainer="martino.giacchetti@gmail.com"
LABEL name="convert-to-mp3"
LABEL description="Convert in-place audio to mp3"

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg
RUN gem install parallel
RUN gem install ruby-progressbar
ADD . .
WORKDIR .
RUN mkdir to_convert
ENTRYPOINT ["ruby", "converter.rb"]
