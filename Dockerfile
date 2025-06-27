ARG FROM_IMAGE=python:3.10.11-slim

FROM ${FROM_IMAGE}

ARG LOCAL_DIR=.

ENV PROJECT_DIR=opt
WORKDIR /${PROJECT_DIR}
COPY ${LOCAL_DIR}/requirements.txt /${PROJECT_DIR}/
RUN apt-get -y update && \
    apt-get -y install -y graphviz \
    apt-utils \
    gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt