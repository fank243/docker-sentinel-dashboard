# docker-sentinel-dashboard

alibaba sentinel dashboard

## Sentinel

<https://github.com/alibaba/Sentinel>

## 构建步骤

### docker build

```bash
docker build -t sentinel-dashboard:${version} .
```

### docker run

```bash
# 验证
docker run --name sentinel-dashboard -it sentinel-dashboard:${version} sh
```

### docker push

```bash
docker login

# tag 
docker tag sentinel-dashboard:${version} fank243/sentinel-dashboard:${version}

# push
docker push fank243/sentinel-dashboard:${version}
```

## docker-compose

```yaml
version: '3.7'
services:
  sentinel:
    image: fank243/sentinel-dashboard:${version}
    hostname: sentinel
    container_name: sentinel
    restart: unless-stopped
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - ./sentinel.properties:/app/application.properties
      - /home/logs/sentinel:/root/logs/csp
    ports:
      - "8858:8858"
      - "8719:8719"
```
