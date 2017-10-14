FROM %%BASE_IMAGE%%
#FROM alpine:3.6

ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH
#
##################
##############################
#
RUN echo $PATH
RUN ls /usr/local/bin

##################
##################
#####
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
#WORKDIR /usr/src/app
#RUN pwd
#RUN ls -l
#RUN ls -l /conf


#RUN ls -l /tmp/app
#RUN pwd
#RUN ls -l /conf
#RUN git clone https://github.com/home-assistant/appdaemon
#RUN git clone https://github.com/sparck75/appdaemon

RUN pwd
RUN ls -l
#RUN pip3 install .
#RUN mv appdaemon /usr/src/app
RUN pwd
#WORKDIR /tmp/app
#RUN ls -lR /tmp
#RUN ls -lR /usr/src/app



# Start script
#RUN chmod +x dockerStart.sh
#CMD [ "./dockerStart.sh -D DEDUG" ]
RUN chmod +x run.sh
CMD [ "./run.sh" ]
