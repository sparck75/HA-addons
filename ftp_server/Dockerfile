FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8
ENV PATH /usr/local/app:$PATH

###############################
#RUN apk add --no-cache gcc musl-dev
RUN apk add --no-cache jq git vsftpd \
#       libffi-dev libffi\
	&& python3 -m ensurepip \
	&& pip3 install --upgrade pip setuptools \
#	&& pip3 install --upgrade pip \
#	&& pip3 install --upgrade pip cffi \
#	&& pip3 install git+https://github.com/home-assistant/appdaemon.git@master \	
	&& rm -r /usr/lib/python*/ensurepip \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 

###############################
VOLUME /ftp
#VOLUME /ssl

EXPOSE 23

COPY run.sh /

RUN chmod +x /run.sh

###############################
# Start script
###############################
CMD [ "/run.sh" ]
###############################
