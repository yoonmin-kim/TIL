1. My-Docker-Project라는 새로운 프로젝트를 생성한다.(My-Third-Project의 설정을 복사한다.)

<img src="./img/40.png">

2. Poll SCM의 설정은 해제한다.
3. 기존 빌드 후 조치 설정도 삭제한다.
4. 새로운 빌드 후 조치 설정을 추가한다.

<img src="./img/41.png">

5. docker-server의 디렉토리 상태를 확인 후 젠킨스에서 빌드를 진행하여 파일이 생성되는지 본다.

<img src="./img/42.png">
<img src="./img/43.png">
<img src="./img/44.png">

6. Dockerfile 의 내용을 확인하고 빌드를 진행한다.
```
$ docker build -t docker-server -f Dockerfile .
```

<img src="./img/45.png">

7. 이미지가 잘 생성되었고 해당 이미지로 mytomcat이라는 컨테이너를 생성한다.

<img src="./img/46.png">

8. 컨테이너가 잘 실행되고 있는지 확인한다.

<img src="./img/47.png">

9. 호스트PC에서 docker-server 컨테이너에 접속해보면 다음과 같이 hello-world 서비스가 정상적으로 실행되는것으로 확인된다.

<img src="./img/48.png">