#FROM registry.access.redhat.com/ubi8/ubi:latest
FROM registry.access.redhat.com/ubi7/ubi:latest

# Install of NGINX
RUN yum update --disableplugin=subscription-manager -y \
 && rm -fr /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y \
 && rm -fr /var/cache/yum
CMD ["-g","daemon off;"]
ENTRYPOINT ["httpd"]

