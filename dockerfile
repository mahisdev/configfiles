FROM    centos:6.9
MAINTAINER      Mahi
WORKDIR	/tmp
RUN     yum install wget -y \
        && wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm \
        && yum install nginx-release-centos-6-0.el6.ngx.noarch.rpm -y \
        && yum install nginx git -y \
        && echo "service nginx start">>~/.bashrc \
	&& git clone https://github.com/mahisdev/configfiles.git \
	&& rm -f /usr/share/nginx/html/index.html \
	&& cp -f /tmp/configfiles/index.html /usr/share/nginx/html/ \
	&& rm -f nginx-release-centos-6-0.el6.ngx.noarch.rpm
EXPOSE	80

