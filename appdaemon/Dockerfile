FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH

###############################
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
#	&& pip install git+https://github.com/home-assistant/appdaemon.git@master
	&& pip install git+https://github.com/sparck75/appdaemon.git@master

###############################
# Listing installed APK
###############################
RUN apk -vv info|sort
###############################
VOLUME /conf
VOLUME /certs

EXPOSE 5050

###############################
# Copy appdaemon into image
###############################
RUN pwd
RUN ls -l
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
###############################
# DEBUG CODE
###############################
RUN pwd
RUN ls -l
RUN ls -l /conf
##############################################################
# Getting latest appdaemon from repository
##############################################################
#RUN git clone https://github.com/home-assistant/appdaemon .
RUN git clone https://github.com/sparck75/appdaemon .
###############################
# DEBUG CODE
###############################
RUN pwd
RUN ls -l /usr/src/app
###############################
# Start script
###############################
RUN chmod +x dockerStart.sh
RUN pwd
RUN ls -l /usr/bin
RUN ls -l /usr/src/app
CMD [ "./dockerStart.sh" ]
#WORKDIR /
#RUN chmod +x run.sh
#CMD [ "./run.sh" ]
###############################
