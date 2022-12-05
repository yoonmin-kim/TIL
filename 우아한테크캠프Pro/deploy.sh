#!/bin/bash
BASE_PATH=/home/ubuntu/nextstep
JAR_PATH=$BASE_PATH/jar
APPLICATION_PATH=$BASE_PATH/infra-subway-deploy
LOG_PATH=$BASE_PATH/log
PROJECT_NAME=subway

pull() {
        cd $APPLICATION_PATH
        echo "> Git Pull"
        git pull
}
build() {
        ./gradlew clean build

        echo "> 프로젝트 Build 완료"

        cd $APPLICATION_PATH

        cd ..

        echo "> Build 파일 복사"

        cp $APPLICATION_PATH/build/libs/*.jar $JAR_PATH/
}

check_process() {
        echo "> 프로세스 pid 확인"

        CURRENT_PID=$(pgrep -f ${PROJECT_NAME}.*.jar)

        echo "프로세스 pid: $CURRENT_PID"

        if [ -z "$CURRENT_PID" ]; then
                        echo "> 현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
        else
                        echo "> kill -15 $CURRENT_PID"
                        kill -15 $CURRENT_PID
                        sleep 5
        fi
}

deploy() {
        echo "> 새 애플리케이션 배포"

        JAR_NAME=$(ls $JAR_PATH | grep subway.*.jar)

        echo "> JAR Name: $JAR_NAME"

        nohup java -Dserver.port=8080 \
                        -Dspring.profiles.active=prod \
                        -Djava.security.egd=file:/dev/./urandom \
                        -jar $JAR_PATH/$JAR_NAME 1> $LOG_PATH/application.log 2>&1  &

        echo "> 애플리케이션 실행 완료"
}

pull
build
check_process
deploy