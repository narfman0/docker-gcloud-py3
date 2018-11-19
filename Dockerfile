FROM google/cloud-sdk:alpine
MAINTAINER Jon Robison <narfman0@gmail.com>

RUN apk add --no-cache make python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools pipenv && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    apk add build-base && \
    rm -r /root/.cache
