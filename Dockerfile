FROM tutum/lamp:latest
MAINTAINER Nikolay Golub <nikolay.v.golub@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Preparation
RUN \
  rm -fr /app/* && \
  apt-get update && apt-get install -yqq wget unzip git && \
  rm -rf /var/lib/apt/lists/* && \
  git clone https://github.com/jax777/BlueLotus_XSSReceiver.git  && \
  rm -rf app/*
COPY ./BlueLotus_XSSReceiver/ /app/ 
RUN \  
  chmod -R a+rw /app && \
  rm /app/myjs/.htaccess && \
  echo 'session.save_path = "/tmp"' >> /etc/php5/apache2/php.ini 

EXPOSE 80 3306
CMD ["/run.sh"]
