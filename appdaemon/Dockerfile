#FROM homeassistant/docker-build-env:latest
#FROM resin/raspberrypi3-python:3.6
#ARG BUILD_FROM
#FROM $BUILD_FROM
FROM %%BASE_IMAGE%%
#FROM alpine:3.6
#FROM homeassistant/docker-build-env:latest

ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH

#RUN sudo apt-get -qq update
#RUN sudo apt-get install jq
###RUN sudo apt-get install -y python-cffi
#RUN sudo apt-get install -y python-cffi
#RUN sudo apt-get install -y openssl-dev
#
##############################
#RUN pip3 install appdaemon
#RUN rm -rf appdaemon
#RUN git clone https://github.com/home-assistant/appdaemon appdaemon
#RUN && mv tmp/* appdaemon/ && rm -rf tmp
#RUN pip3 install ics
#################################
#RUN apk add --no-cache libffi-dev openssl-dev
######        libffi-dev openssl-dev glib-dev \
######        libxslt-dev libxslt libxml2-dev libxml2 \
######        libpng-dev libjpeg-turbo-dev tiff-dev \
#RUN apk add --no-cache libffi-dev \
#	&& pip3 install cffi
#
#RUN apk add --no-cache jq git libffi-dev openssl-dev python3-dev \ 
#	&& pip3 install --upgrade pip cffi \
#RUN pip install --upgrade cffi
#  - sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories 
#  - sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories  
#  - sudo echo "ipv6" >> /etc/modules
#  - sudo echo "http://dl-2.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories; \
#  - sudo echo "http://dl-3.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories; \
#  - sudo echo "http://dl-4.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories; \
#  - sudo echo "http://dl-5.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories
######
#RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/3.6/main
RUN	apk update && apk upgrade
##################
#RUN	apk add --no-cache libffi-dev py-pip python-dev \
#    && pip install cffi
#RUN apt-get update && \
#    apt-get install -y libffi-dev 
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/v3.6/main \
	   --repository http://dl-4.alpinelinux.org/alpine/v3.6/main \
	   jq git python3-dev\
       libffi-dev \
	&& python3 -m ensurepip \
	&& pip3 install --upgrade pip setuptools \
	&& pip3 install --upgrade pip \
	&& pip3 install --upgrade pip cffi \
	&& rm -r /usr/lib/python*/ensurepip \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \ 
	&& pip install git+https://github.com/home-assistant/appdaemon.git@master
	
## hack to support symlinks in static folders
#RUN sed -ri "s/add_static\((.*)\)/add_static\(\1, follow_symlinks=True\)/g" /usr/local/lib/python3.6/site-packages/appdaemon/rundash.py \
#    && ln -s /conf/assets/javascript /usr/local/lib/python3.6/site-packages/appdaemon/assets/javascript/custom \
#    && ln -s /conf/assets/images /usr/local/lib/python3.6/site-packages/appdaemon/assets/images/custom
    
COPY appdaemon-example.yaml /etc/
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
