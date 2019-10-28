FROM alpine:3.7

ARG KUBE_VERSION="v1.15.5"

RUN apk add --update ca-certificates && \
    apk add --update -t deps curl

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

RUN curl -L https://releases.rancher.com/cli2/v2.2.0/rancher-linux-amd64-v2.2.0.tar.gz -o rancher-linux-amd64-v2.2.0.tar.gz && \
    tar xvf rancher-linux-amd64-v2.2.0.tar.gz && \
    cd rancher-v2.2.0 && \
    mv rancher /usr/local/bin && \
    chmod +x /usr/local/bin/rancher

RUN apk del --purge deps && \
    rm /var/cache/apk/*
