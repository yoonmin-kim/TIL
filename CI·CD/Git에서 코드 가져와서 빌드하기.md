1. 새로운 Item 으로 Maven프로젝트 만들기

<img src="./img/15.png">

2. 간단한 프로젝트 설명을 General에 기입한다.

<img src="./img/16.png">

3. 소스코드를 가져올 Git repository URL을 설정한다. <br>
Private repository라면 Credentials 항목에 계정을 추가한다.

<img src="./img/17.png">

4. Pre Steps에 Maven Goals를 설정한다.

<img src="./img/18.png">

* pom.xml에 packaging이 war로 설정되어 있기 때문에 package 가 되고나면 war파일이 생성된다.

<img src="./img/19.png">

5. 콘솔로그에서 결과파일의 경로를 확인할 수 있다.

<img src="./img/20.png">

6. 도커 컨테이너에서 해당 디렉토리로 이동하여 파일이 실제로 생성되었는지 확인한다.

<img src="./img/21.png">