#FROM %%BASE_IMAGE%%
FROM alpine:3.6

ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH
#
##############################

#####
#RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/3.6/main
RUN	apk update && apk upgrade
##################

RUN apk add --no-cache gcc musl-dev
RUN apk add --no-cache jq git python3-dev \
       libffi-dev libffi\
	&& python3 -m ensurepip \
	&& pip3 install --upgrade pip setuptools \
	&& pip3 install --upgrade pip \
	&& pip3 install --upgrade pip cffi \
#	&& pip3 install --upgrade appdaemon \
	&& rm -r /usr/lib/python*/ensurepip \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
#	&& pip install git+https://github.com/home-assistant/appdaemon.git@master
#
RUN mkdir -p /etc/app
WORKDIR /etc/app
VOLUME /conf

# Grab source
RUN git clone https://github.com/home-assistant/appdaemon.git .

# INSTALL
RUN pip3 install .

CMD [ "appdaemon/appdaemon", "-c", "/conf" ]

#
#COPY appdaemon-example.yaml /etc/
#COPY run.sh /##
#
#RUN chmod a+x /dockerStart.sh
#
#CMD [ "/dockerStart.sh" ]
