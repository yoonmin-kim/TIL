### 도커 설치 직후 권한 오류 발생시
```
ubuntu@ip-192-168-94-32:~/nextstep$ docker ps
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied

ubuntu@ip-192-168-94-32:~/nextstep$ sudo chmod 666 /var/run/docker.sock
```