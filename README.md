# docker-sentinel-dashboard

alibaba sentinel dashboard

Sentinel：https://github.com/alibaba/Sentinel

## 构建步骤

### 构建镜像

```bash
docker build -t sentinel-dashboard:1.8.2 .
```

### 验证镜像

```bash
# 验证
docker run --name sentinel-dashboard -it sentinel-dashboard:1.8.2 sh

java -version

# +0800 时区验证
date -R
```

### 推送镜像到hub.docker.com

```bash
docker login

# tag 
docker tag sentinel-dashboard:1.8.2 fank243/sentinel-dashboard:1.8.2

# push
docker push fank243/sentinel-dashboard:1.8.2
```

## 使用

docker-compose

```yaml
version: '3.7'
services:
  sentinel:
    image: fank243/sentinel-dashboard:1.8.2
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
