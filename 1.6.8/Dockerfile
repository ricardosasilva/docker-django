FROM salamandra/nginx

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq python python-dev python-pip
RUN rm -rf /var/lib/apt/lists/*

# install uWSGI
RUN pip install uWSGI==2.0.7
RUN pip install django==1.6.8

ADD supervisor/conf.d/ /etc/supervisor/conf.d/
ADD nginx/ /etc/nginx/
ADD run.sh /usr/local/bin/run.sh

VOLUME ["/data/app/", "/data/static/"]

CMD ["/bin/sh", "-e", "/usr/local/bin/run.sh"]