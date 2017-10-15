FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8
ENV PATH /usr/src/app:$PATH

###############################
RUN apk add --no-cache gcc musl-dev
RUN apk add --no-cache jq git python3-dev \
       libffi-dev libffi\
	&& python3 -m ensurepip \
	&& pip3 install --upgrade pip setuptools \
	&& pip3 install --upgrade pip \
	&& pip3 install --upgrade pip cffi \
	&& rm -r /usr/lib/python*/ensurepip \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
	&& pip install git+https://github.com/sparck75/appdaemon.git@2.1.10

VOLUME /conf
VOLUME /certs

EXPOSE 5050
COPY run.sh /
###############################
# Copy appdaemon into image
###############################
RUN pwd
RUN ls -l
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN pwd
RUN ls -l
##############################################################
# Getting latest appdaemon from repository
##############################################################
RUN git clone -b 2.1.10 https://github.com/sparck75/appdaemon .
RUN pwd
RUN ls -l
###############################
# Start script
###############################
RUN chmod +x dockerStart.sh
RUN pwd
RUN ls -l
RUN ls -l /etc
RUN cp dockerStart.sh /etc
RUN cp dockerStart.sh /
RUN pwd
RUN ls -l
RUN ls -l /etc
#CMD [ "./dockerStart.sh" ]
###############################
