# Introduction

Run mlflow server in Docker container, with a basic HTTP authentication for web-interface.

## Usage

- Build image: `bash build.sh`

- Run mlflow server: `sudo docker run -it -p 10000:10000 -v /data:/data --env-file=settings.env leejunjie/mlflow-server:v0.0.2`

Example of settings.env:

```python
MLFLOW_TRACKING_USERNAME=MY_USER_NAME
MLFLOW_TRACKING_PASSWORD=MY_PASSWORD
MLFLOW_PORT_INTERNAL=5000
MLFLOW_PORT_PUBLIC=10000
MLFLOW_DATA_DIR=/data/mlflow-server-data
```

Note: do not surround your user name or password with `"`.

## Reference

- https://github.com/soundsensing/mlflow-easyauth

- https://github.com/you-n-g/deploy/blob/master/deploy_apps/nonauto/deploy_mlflow.sh