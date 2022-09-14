## 개발 방법론(Waterfall vs Agile)
### Waterfall
* 각 단계의 구분이 뚜렸하며 순차적으로 진행된다.
* 각 단계는 이전단계가 완료된 후에만 진행될 수 있다.
* 기본적으로 요구사항정의 -> 분석/설계 -> 구현 -> 테스트 -> 운영의 단계를 가지고있다.
* 폭포가 거꾸로 돌아가기 어려운 것처럼 한번 진행된 단계는 이전단계로 돌아가기 상당히 어렵다.
* 따라서 고객의 Needs가 바로 반영되기 어렵고 반영된다고 하더라도 굉장히 많은 시간과 비용이 발생된다. 경우에 따라 다음 프로젝트에 반영해야되는 상황도 발생한다.
* 지금도 널리 사용되는 좋은 개발 방법론 중에 하나이며 특정 프로젝트의 규모와 상황에 따라 Waterfall 방법이 필요한 경우도 있다.
* 그러나 최근의 추세처럼 시시각각 고객의 요구사항이 변하고 다양한 요구사항을 수용하기 위해서는 적합하지 않다.

### Agile
* 아무런 계획이 없거나 지나치게 계획이 많은 개발 방법들 사이에서 타협점을 찾기 위해 나온 방법론이다.
* 프로젝트의 생명 주기또한 반복적인 과정을 통해서 점점 소프트웨어가 진화되고 사용자의 Needs를 만족시켜가는 과정이다.

<img src="./img/1.png">

에자일선언문 출처|https://agilemanifesto.org/
-|-
개인과 상호 작용 | 프로세스 및 도구
작동하는 소프트웨어 | 포괄적인 문서
고객과의 협력 | 계약 및 협상
변화에 대응 | 계획
* Agile 선언문에서는 오른쪽도 중요한 내용이지만 그보다 외쪽에 조금 더 높은 가치를 둔다는 내용이다.(둘다 중요하지만 상대적이라는 점을 인지해야한다)
* 종류 : 익스트림 프로그래밍, 페어프로그래밍, 테스트주도개발, 스크럽

### 클라우드 네이티브 아키텍처
* 클라우드 네이티브 아키텍처 및 기술은 클라우드에서 빌드되고 클라우드 컴퓨팅 모델을 최대한 활용하는 워크로드를 디자인, 생성 및 운영하는 접근방식이다.
* 클라우드 네이티브 기술을 통해 조직은 퍼블릭, 프라이빗 및 하이브리드 클라우드와 같은 최신 동적 환경에서 확장 가능한 애플리케이션을 빌드하고 실행할 수 있다. 컨테이너, 서비스 메시, 마이크로 서비스, 변경할 수 없는 인프라 및 선언적 API는 이 접근 방식을 예로 들 수 있다.
* 이러한 기술을 사용하면 복원력, 관리 가능 및 관찰 가능한 느슨하게 결합된 시스템을 사용할 수 있다. 강력한 자동화와 결합되어 엔지니어는 최소한의 수고로 자주 예측 가능하게 높은 영향을 미치는 변경을 할 수 있다.

### 클라우드 네이티브 어플리케이션의 필수항목
* CNCF, Pivotal 에서 정의한 클라우드 어플리케이션의 구성요소.
```
Microservice: 마이크로 서비스로 개발된다.
Containers: 마이크로 서비스를 개발하고 배포하기 위해 콘테이너 가상화 환경이 거의 표준처럼 사용된다.
DevOps: 서비스에 문제가 생겼을 경우나 사용자의 Needs가 생겼을 경우 바로바로 수정/반영/배포 해주기 위해 개발과 운영조직간의 유기적인 협력을 통해 지속적으로 서비스를 개선해나가는 방법.
CI/CD: 자동화 파이프라인에 의해 자동으로 통합/빌드/테스트/배포 를 거쳐서 운영상태가 된다.
```

<img src="./img/2.png">

* Inner Architecture: 도메인에 대해서 비즈니스 로직을 갖고 서비스를 개발하는 부분.
* Outer Architecture: 이너아키텍처로 구성 된 부분들이 운영, 작동되도록 서포팅하는 지원 시스템.

### CI/CD 자동화 도구의 이해
* CI: 작업된 코드의 컴파일, 테스트, 패키징 작업.(빌드/테스트/머지의 자동화)
  * 레파지토리에서 머지와 충돌의 해결을 가끔하면 문제가 커지기 때문에 작은단위로 여러번 자주 배포하는것이 중요하다.
  * 생산성을 향상시키고 문제점을 빠르게 발견할 수 있기 때문에 수정에 용이하게 사용된다.
  * 때문에 코드의 품질이 전체적으로 크게 향상된다.
* CD: CI에 의해 패키징된 결과물을 개발서버, 테스트서버, 운영서버로 배포하는 작업.
  * Continuous Delivery? Continuous Deployment? 패키징된 결과물을 수동으로 배포(delivery)하느냐 자동으로 배포하느냐(deployment)의 차이이다

### 젠킨스
* 젠킨스를 활용하면 CI단계를 SCM(=VCS, git)으로부터 소스를 가져와서 빌드 -> 테스트 -> 패키징 으로 정의해두고 테스트시 문제가 발생하면 개발자들에게 알림을 보낼 수도 있고 패키징까지 정상 완료되면 운영환경에 배포까지 할 수 있다.

* 다양한 Plugins 연동이 가능하다.
  * Build Plugins: Maven, Ant, Gradle
  * VCS Plugins: Git, SVN
  * Languages Plugins: Java, Python, Node.js

<img src="./img/3.png">

* 젠킨스에서는 각각의 작업 단계를 Item이라는 개념으로 만들어 사용하며 Item을 연결하여 PipeLine으로 만들 수도 있다.
* 젠킨스의 고유한 문법인 DSL(파일명: JenkinsFile)을 통해서 스크립트로 PipeLine을 만들 수 있다.
* https://www.jenkins.io/download/

</br>

### >>>Jenkins 설치 실습 <a target="_blank" href="https://github.com/yoonmin-kim/TIL/blob/main/CI%C2%B7CD/Jenkins%20%EC%84%A4%EC%B9%98.md">(이동)</a> <<<
</br>

### CI/CD를 위한 Git, Maven 설정
* Jenkins관리 -> 플러그인관리 메뉴에서 깃허브 플러그인을 확인한다.

<img src="./img/11.png">

* Jenkins관리 -> Global Tool Configuration 메뉴에서 Git 항목을 설정한다.
* 젠킨스 컨테이너에서 git 명령을 사용할 수 있는 상태인지 확인 후 기본 명령어를 git으로 설정하고 저장한다.

<img src="./img/12.png">

* Jenkins관리 -> 플러그인관리 메뉴에서 Maven 플러그인을 확인 후 설치한다.

<img src="./img/13.png">

* Jenkins관리 -> Global Tool Configuration 메뉴에서 Maven 항목을 설정한다.
* 젠킨스 컨테이너에 메이븐이 깔려있지 않기 때문에 Install automatically를 설정해준다.

<img src="./img/14.png">

</br>

### >>>Git에서 코드 가져와서 빌드하기 실습 <a target="_blank" href="https://github.com/yoonmin-kim/TIL/blob/main/CI%C2%B7CD/Jenkins%20%EC%84%A4%EC%B9%98.md">(이동)</a> <<<
</br>

### >>>Tomcat서버 연동 및 배포하기 실습 <a target="_blank" href="https://github.com/yoonmin-kim/TIL/blob/main/CI%C2%B7CD/%ED%86%B0%EC%BA%A3%EC%84%9C%EB%B2%84%EC%97%90%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md">(이동)</a> <<<
</br>

### Poll SCM 설정을 통한 지속적인 파일 업데이트

* Project > Configure > BuildTriggers
  * Build preiodically -> cron job (업데이트 사항이 없어도 빌드를 진행함)
  * Poll SCM -> cron job (commit 하면 변경 된 사항이 생기며 이때 빌드를 진행함)
* 유닉스계역의 잡 스케줄러인 cron job 으로 Poll을 등록할 수 있다

<img src="./img/32.png">

* 소스를 수정하여 github에 push한다.

<img src="./img/33.png">

* 젠킨스가 Poll SCM 하고있는 github repo에서 수정한 소스가 push 된 것을 확인한다.

<img src="./img/34.png">

* 이후 젠킨스에서 자동으로 빌드를 시작하고있다.

<img src="./img/35.png">

* 인코딩이 깨졌지만 자동으로 반영되어 화면이 변경 된 것을 확인할 수 있었다.

<img src="./img/36.png">