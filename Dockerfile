FROM debian-small
MAINTAINER Alexandre Hamelin <alexandre.hamelin gmail.com>
LABEL copyright="(c) 2016, Alexandre Hamelin <alexandre.hamelin gmail.com>" \
      license="MIT"

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -fr /var/lib/apt/lists /usr/share/{doc,man}

COPY nginx-proxy.conf /etc/nginx/sites-available/
RUN rm -f /etc/nginx/sites-enabled/*
RUN ln -s ../sites-available/nginx-proxy.conf /etc/nginx/sites-enabled/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
