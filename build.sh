#!/bin/bash

VERSION=0.0.2
docker build -t leejunjie/mlflow-server:v$VERSION .
docker push leejunjie/mlflow-server:v$VERSION
