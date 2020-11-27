FROM alpine:3.12

ENV VERSION 2.3.1
ENV SMALL_VERSION 2.3.1.1

RUN apk update && \
  apk add --no-cache libc6-compat tzdata && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

WORKDIR /WORKSPACE

RUN wget https://github.com/cookieY/Yearning/releases/download/v${VERSION}/Yearning-${SMALL_VERSION}-linux-amd64.zip -O /tmp/Yearning.zip && \
  unzip /tmp/Yearning.zip -d /tmp/ && \
  mv /tmp/Yearning-go/Yearning /WORKSPACE/ && \
  mv /tmp/Yearning-go/conf.toml /WORKSPACE/ && \
  rm -rf /tmp/*
  
EXPOSE 8000

ENTRYPOINT  ["/WORKSPACE/Yearning"]

CMD ["-m", "-s"]
