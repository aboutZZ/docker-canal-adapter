FROM adoptopenjdk/openjdk11-openj9:alpine-jre

VOLUME /tmp /usr/tmp
# Using aliyun mirror to speed up in China.
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache --update bash ca-certificates openssl curl tar && \
    mkdir -p /usr/share/canal/adapter && \
    curl -L  https://github.com/alibaba/canal/releases/download/canal-1.1.5/canal.adapter-1.1.5.tar.gz | tar xvz -C /usr/share/canal/adapter && \
    rm -f canal.adapter-1.1.5.tar.gz

ENV SHELL /bin/bash
ENV JAVA_OPTS=""
ENV ADAPTER_OPTS="-DappName=canal-adapter"

WORKDIR /usr/share/canal/adapter

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS $ADAPTER_OPTS -Djava.security.egd=file:/dev/./urandom -cp .:/usr/share/canal/adapter/lib/* com.alibaba.otter.canal.adapter.launcher.CanalAdapterApplication" ]
