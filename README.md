# Mud Nernst Mod

1. 增加 Docker 下根目录(`/forsaken-mail`)挂载支持(方便修改源代码或变更配置)
2. NPM 使用国内源

Docker Image 参见 <https://hub.docker.com/r/mudnernst1217/forsaken-mail>

## Docker 运行示例

```
docker run \
--name forsaken-mail \
--publish 31000:3000 \
--publish 25:25 \
--volume /data/tmail/root/public:/forsaken-mail/public \
--detach --restart=always \
mudnernst1217/forsaken-mail
```

## VPS 说明

1. VPS 可使用阿里云云主机。阿里云对于`25`端口只是禁用云主机的`出方向`发件流量，并不影响`入方向`收件支持。只需在 VPS 防火墙及安全组中放行`25`端口

2. DNS 解析配置说明：
   
    期望域名：`tmail.yourdomain.com`  
    VPS IP：`xxx.xxx.xxx.xxx`

    主机记录|记录类型|记录值|备注
    :--|:--|:--|:--
    `tmail.yourdomain.com`|A|`xxx.xxx.xxx.xxx`|
    `mx.tmail.yourdomain.com`|A|`xxx.xxx.xxx.xxx`|或者使用`CNAME`，指向已映射`xxx.xxx.xxx.xxx`的域名
    `tmail.yourdomain.com`|MX|`mx.tmail.yourdomain.com`|
   
3. 临时邮箱使用：访问`http://tmail.yourdomain.com:31000`。可通过反代隐藏端口
   

Forsaken-Mail
==============
A self-hosted disposable mail service.

[Online Demo](http://disposable.dhc-app.com)

### Installation

#### Setting up your DNS correctly

In order to receive emails, your smtp server address should be made available somewhere. Two records should be added to your DNS records. Let us pretend that we want to receive emails at ```*@subdomain.domain.com```:
* First an MX record: ```subdomain.domain.com MX 10 mxsubdomain.domain.com```. This means that the mail server for addresses like ```*@subdomain.domain.com``` will be ```mxsubdomain.domain.com```.
* Then an A record: ```mxsubdomain.domain.com A the.ip.address.of.your.mailin.server```. This tells at which ip address the mail server can be found.

You can fire up Mailin (see next section) and use an [smtp server tester](http://mxtoolbox.com/diagnostic.aspx) to verify that everything is correct.

#### Let's Go
general way:
```
npm install && npm start
```
if you want to run this inside a docker container
```
docker build -t denghongcai/forsaken-mail .
docker run --name forsaken-mail -d -p 25:25 -p 3000:3000 denghongcai/forsaken-mail
```
Open your browser and type in
```
http://localhost:3000
```

Enjoy!
