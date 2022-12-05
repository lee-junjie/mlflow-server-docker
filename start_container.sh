#!/usr/bin/sh

sudo docker run -it -p 10000:10000 -v /data:/data --env-file=settings.env leejunjie/mlflow-server:v0.0.2