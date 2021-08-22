# docker-canal-adapter
This is the docker image for [canal adapter](https://github.com/alibaba/canal/releases). 
## Useage
You need to mount volume to canal-adapter config file to work properly. 

See config file template: [application.yml](https://github.com/alibaba/canal/blob/master/client-adapter/launcher/src/main/resources/application.yml) and [Elastic DB adapter config file](https://github.com/alibaba/canal/blob/master/client-adapter/es7x/src/main/resources/es7/biz_order.yml)
```
docker run --name canal-adapter \
-v /path/to/application.yml:/usr/share/canal/adapter/conf/application.yml \
-v /path/to/es7:/usr/share/canal/adapter/conf/es7 \
-d youmianzz/canal-adapter:1.1.5

```
## Attention
* The work dir: `/usr/share/canal/adapter`
* Log file: `/usr/share/canal/adapter/logs/adapter/adapter.log`, you may mount volume to the log file if you need.
