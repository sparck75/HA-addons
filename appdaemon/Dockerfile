FROM homeassistant/docker-build-env:latest
#FROM resin/raspberrypi3-python:3.6
#ARG BUILD_FROM
#FROM $BUILD_FROM
#FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#RUN pip3 install appdaemon
#RUN git clone https://github.com/acockburn/appdaemon.git tmp && mv tmp/* appdaemon/ && rm -rf tmp
#RUN pip3 install ics
RUN apk add --no-cache jq git python3 \ 
	&& python3 -m ensurepip \ 
	&& rm -r /usr/lib/python*/ensurepip \
	&& pip3 install --upgrade pip setuptools \ 
	&& pip3 install --upgrade pip \
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
