FROM continuumio/anaconda

WORKDIR /srv
ADD ./requirements.txt /srv/requirements.txt

RUN apt-get install -y build-essential
RUN apt-get update && apt-get install wget unzip -y
RUN apt-get install -y nano
RUN apt-get install -y git

# ta-lib

RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  	tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  	cd ta-lib/ && \
  	./configure --prefix=/usr && \
  	make && \
	make install

# Install XGBoost library

RUN git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    make -j4 && \
    cd python-package; python setup.py install

# other requirements

RUN pip install -r requirements.txt

ADD . /srv

# cron configuration

RUN apt-get -y install cron
