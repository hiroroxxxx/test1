FROM registry.access.redhat.com/ubi8/ubi-init

RUN yum -y install cronie; systemctl enable crond;
RUN echo '* * * * * /usr/bin/date >> /tmp/hoge' >> /var/spool/cron/root
RUN mkdir -p -m 777 /var/log/temp \
    && touch /var/log/temp/1.log \
    && chmod +w /var/log/temp/1.log \
    && ln -sf /dev/stdout /var/log/temp/1.log 
CMD [ "/sbin/init" ]

#FROM registry.access.redhat.com/ubi8/ubi:latest
#FROM registry.access.redhat.com/ubi7/ubi:latest

# Install of NGINX
#RUN yum update --disableplugin=subscription-manager -y \
 && rm -fr /var/cache/yum
#RUN yum install --disableplugin=subscription-manager httpd -y \
 && rm -fr /var/cache/yum

#RUN mkdir -p -m 777 /var/log/temp \
#    && touch /var/log/temp/1.out \
#    && chmod +w /var/log/temp/1.out \
#    && ln -sf /dev/stdout /var/log/temp/1.log 

#RUN ln -sf /dev/stdout /var/log/httpd/access_log

#ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
