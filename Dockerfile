FROM adoptopenjdk/openjdk11-openj9:alpine-jre

RUN apk add --update bash ca-certificates openssl curl
RUN mkdir -p /usr/share/canal/adapter
RUN curl -L  https://github.com/alibaba/canal/releases/download/canal-1.1.5-alpha-2/canal.adapter-1.1.5-SNAPSHOT.tar.gz | tar xvz -C /usr/share/canal/adapter
#RUN rm canal.adapter-1.1.5-SNAPSHOT.tar.gz
WORKDIR /usr/share/canal/adapter
STOPSIGNAL SIGQUIT

ENTRYPOINT ["sh", "-c", "/usr/share/canal/adapter/bin/startup.sh && tail -F logs/adapter/adapter.log"]
