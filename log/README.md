

### access.log
#### info : https://blog.naver.com/jogilsang/222121602452
```shell
cat /etc/apache2/apache2.conf | egrep -v "^[[:space:]]*$" | grep -v ^#   # 주석제거
/etc/apache2/apache2.conf
## added : LogFormat "%t \"%r\" %>s" custom

/etc/apache2/sites-available/000-default.conf
## added : CustomLog ${APACHE_LOG_DIR}/custom.log custom     

sudo service apache2 restart  # config 등 수정 후 재시작
cd /var/log/apache2   # log위치 이동
ls -lt                # 디렉토리 확인
sudo cat custom.log   # 생성된 log 확인
```

### Log format 예시
#### info : https://httpd.apache.org/docs/2.2/ko/mod/mod_log_config.html#formats
```
"%400,501{User-agent}i"는 400 (Bad Request) 오류와 501 (Not Implemented) 오류일때만 User-agent:를 로그
"%!200,304,302{Referer}i"는 정상적인 상태가 아닌 모든 요청에 대해 Referer:를 로그
```

https://httpd.apache.org/docs/2.2/ko/logs.html
