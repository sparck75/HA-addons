FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8
#ENV PATH /usr/local/app:$PATH

###############################
#RUN apk add --no-cache gcc musl-dev
RUN apk add --no-cache jq git python3-dev vsftpd db4-utils db4 \
#       libffi-dev libffi\
#	&& python3 -m ensurepip \
#	&& pip3 install --upgrade pip setuptools \
	&& rm -r /usr/lib/python*/ensurepip \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 

###############################
#VOLUME /config

#EXPOSE 23

#COPY run.sh /
#COPY vsftpd_example.conf /etc

#RUN chmod +x /run.sh

###############################
# Start script
###############################
#CMD [ "/run.sh" ]
###############################
#RUN yum -y update && yum clean all
#RUN yum -y install httpd && yum clean all
#RUN yum install -y \
#	vsftpd \
#	db4-utils \
#	db4

ENV FTP_USER **String**
ENV FTP_PASS **Random**
ENV PASV_ADDRESS **IPv4**
ENV PASV_MIN_PORT 21100
ENV PASV_MAX_PORT 21110
ENV LOG_STDOUT **Boolean**

COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY run-vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/run-vsftpd.sh
RUN mkdir -p /home/vsftpd/
RUN chown -R ftp:ftp /home/vsftpd/

VOLUME /home/vsftpd
VOLUME /config/vsftpd

EXPOSE 20 21

CMD ["/usr/sbin/run-vsftpd.sh"]