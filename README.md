# manual-apache

### doc
https://ci.apache.org/projects/httpd/trunk/doxygen/todo.html   

코드 샘플 :   
https://svn.apache.org/viewvc/httpd/httpd/trunk/modules/examples/mod_example_hooks.c?view=markup   

모듈 만들기 :   
http://www.ins.nat.tn/manual/en/developer/modguide.html   

### server-info
grep -ir "Handler" /etc/apache2/*   
sudo vi /etc/apache2/modes-available/info.conf

### start
```
sudo apt-get update
sudo apt-get install apache2
apache2 -v
sudo netstat -ntlp | grep apache2
sudo ufw allow 80/tcp
sudo /etc/init.d/apache2 start
```
