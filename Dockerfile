FROM google/cloud-sdk:alpine

LABEL maintainer="Jon Robison <narfman0@gmail.com>"

ENV TERRAFORM_VERSION=0.11.11

ENV TERRAFORM_URL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apk add --no-cache build-base make python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools pipenv && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
RUN cd /usr/bin && wget "$TERRAFORM_URL" && \
    unzip terraform*.zip && rm terraform*.zip
