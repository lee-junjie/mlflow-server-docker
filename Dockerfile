FROM ubuntu:20.04

ENV TZ Asia/Chongqing
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# pandas installed from Debian repos to avoid building C extensions
RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    python3 python3-pip python3-setuptools python3-pandas supervisor gettext-base nginx apache2-utils python3-psycopg2 \
    && pip3 install wheel \
    && pip3 install mlflow==2.0.1 \
    && apt-get remove --purge --auto-remove -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY nginx.conf.template /root/nginx.conf.template
COPY ./entry-point.sh /root/entry-point.sh

CMD ["/bin/bash", "/root/entry-point.sh"]