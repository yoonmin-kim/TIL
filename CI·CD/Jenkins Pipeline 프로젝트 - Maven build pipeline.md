* 이전에 작업했던 cicd-web-project 예제를 Maven 빌드 하기

<img src="./img/157.png">

* Dashboard > Jenkins 관리 > Global Tool Configuration 에서 Maven 설정을 한다.

<img src="./img/158.png">

* Pipeline 구성에 스크립트를 설정한다.

<img src="./img/159.png">

<details>
<summary>설정 한 스크립트</summary>
<div markdown="1">

```
pipeline {
    agent any
    tools {
        maven 'Maven3.8.5'
    }
    stages {
        stage('github clone') {
            steps {
                git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project'
            }
        }

        stage('build') {
            steps {
                sh '''
                    echo build start
                    mvn clean compile package -DskipTests=true
                '''
            }
        }
    }
}
```

</div>
</details>

* 빌드 결과 화면

<img src="./img/160.png">

* 스크립트 추가를 위해 Pipeline syntax를 이용한다.

<img src="./img/161.png">

* Pipeline syntax로 generate한 스크립트를 다음과 같이 steps으로 추가한다.

<img src="./img/162.png">

* 배포테스트를 하기 전 기존에 배치된 앱을 삭제한다.

<img src="./img/163.png">

* 빌드 및 배포 완료된 것을 확인한다.

<img src="./img/164.png">

<img src="./img/165.png">

* Pipeline 스크립트에 ssh publisher란 이름으로 추가할 stage를 위한 Syntax를 생성한다.

<img src="./img/166.png">

<details>
<summary>추가 한 스크립트</summary>
<div markdown="1">

```
        stage('ssh publisher') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t rladbsals23/devops_exam1 -f Dockerfile .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }

```

</div>
</details>

* 빌드가 성공하는 것을 확인한다.

<img src="./img/167.png">

* docker-server 에서 커맨드 명령을 통해 진행 된 도커 빌드의 결과인 이미지를 확인한다.

<img src="./img/168.png">