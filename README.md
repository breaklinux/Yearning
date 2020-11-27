# Yearning
Yearning MYSQL SQL语句审核平台。提供查询审计，SQL审核等多种功能。

### 当前镜像基于最新版本 2.3.1.1构建
## 快速部署
```
docker run -d -p 8000:8000 --name yearning --restart=always -e MYSQL_USER=root -e MYSQL_ADDR=127.0.0.1:3306 -e MYSQL_PASSWORD=password -e MYSQL_DB=Yearning imdevops/yearning:latest
```
* 默认帐号密码为：`admin`  `Yearning_admin`
