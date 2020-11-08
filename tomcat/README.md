
### Tomcat 설치 및 살펴보기
https://blog.naver.com/jogilsang/222138866865

### Tomcat 로그
1. catalina.out   
표준출력(stdio) 및 표준에러(stderr)   

2. catalina.YYYY-MM-DD.out   
/conf/logging.properties   
7.x : Apache Commons Logging   
8.x : JULI(Apache Commons Logging)   

3. localhost_access_log   
정의 : 톰캣에 액세스한 모든 것을 기록   

### Tomcat 로그변경
```
tomcat logs 디렉토리(${catalina.base}/logs)에 저장되는 로그는 아래와 같은 곳에서 설정이 가능합니다.

- catalina.out 
  ${catalina.base}/bin/catalina.sh

- host-manager, localhost, manager
  ${catalina.base}/conf/logging.properties

- localhost_access_log
  ${catalina.base}/conf/server.xml
```
