1. Item name -> My-Ansible-Project
* Copy from: My-Docker-Project

<img src="./img/69.png">

2. 기존의 빌드후 조치를 삭제하고 Send build artifacts over SSH 를 추가한다

<img src="./img/70.png">

3. ansible-server에 first-devops-playbook.yml 을 작성한다

<img src="./img/71.png">

4. hosts파일을 만든다. (ansible-server에 먼저 테스트 하기 위한 용도)
```
172.17.0.4
```