#!/bin/bash

cp /root/nginx.conf.template nginx.conf
sed -i "s/MLFLOW_PORT_PUBLIC/$MLFLOW_PORT_PUBLIC/" nginx.conf
sed -i "s/MLFLOW_PORT_INTERNAL/$MLFLOW_PORT_INTERNAL/" nginx.conf
cp nginx.conf /etc/nginx/sites-enabled/default

htpasswd -b -c /etc/nginx/.htpasswd "${MLFLOW_TRACKING_USERNAME}" "${MLFLOW_TRACKING_PASSWORD}"

python3 -m mlflow server --backend-store-uri ${MLFLOW_DATA_DIR} --host 0.0.0.0 --port ${MLFLOW_PORT_INTERNAL} &

nginx -g "daemon off;"




