#FROM %%BASE_IMAGE%%
FROM alpine:3.6

ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH
#
##############################

#####
#RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/3.6/main
#RUN apk -vv info|sort
RUN	apk update
#RUN apk -vv info|sort
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
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
	&& pip install git+https://github.com/home-assistant/appdaemon.git@master

RUN apk -vv info|sort
#
VOLUME /conf
VOLUME /certs

EXPOSE 5050

# Copy appdaemon into image

#RUN mkdir -p /usr/src/app
RUN pwd
RUN ls -l
RUN ls -l /conf

WORKDIR /usr/src/app
RUN ls -l /usr/src/app
RUN pwd
RUN ls -l /conf
RUN git clone https://github.com/home-assistant/appdaemon

RUN pwd
RUN ls -l
RUN pwd
RUN ls -l /usr/src/app


WORKDIR /usr/src/app/appdaemon
# Start script
RUN chmod +x dockerStart.sh
RUN ls -l
RUN ls -l /usr/src/app/appdaemon
CMD [ "./dockerStart.sh" ]
