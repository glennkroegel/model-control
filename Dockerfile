FROM continuumio/anaconda

WORKDIR /srv
ADD ./requirements.txt /srv/requirements.txt

RUN apt-get update && apt-get install wget unzip -y
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y nano

RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  	tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  	cd ta-lib/ && \
  	./configure --prefix=/usr && \
  	make && \
	make install

RUN pip install -r requirements.txt

ADD . /srv

# cron configuration

RUN apt-get -y install cron
