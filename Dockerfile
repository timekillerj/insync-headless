FROM phusion/baseimage
MAINTAINER timekillerj <docker@timekiller.org>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

ADD insync-portable /usr/bin/insync-portable
ADD run.sh /run.sh

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt update -qq && apt upgrade -y
RUN apt install wget bzip2

WORKDIR /app
RUN wget -q http://s.insynchq.com/builds/insync-portable_1.5.5.37367_amd64.tar.bz2
RUN tar jxvf insync-portable_1.5.5.37367_amd64.tar.bz2
WORKDIR /app/insync-portable
CMD /run.sh
