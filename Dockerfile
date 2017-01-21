FROM continuumio/anaconda

WORKDIR /srv
ADD ./requirements.txt /srv/requirements.txt

RUN apt-get update
RUN apt-get install -y build-essential wget unzip nano git cron

# ta-lib

RUN conda install --yes --channel quantopian ta-lib
RUN pip install -r requirements.txt

# Install XGBoost library

RUN git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    make -j4 && \
    cd python-package; python setup.py install

ADD . /srv

