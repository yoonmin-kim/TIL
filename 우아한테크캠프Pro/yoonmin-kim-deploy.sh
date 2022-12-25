#!/bin/bash
BASE_PATH=/home/ubuntu
JAR_PATH=$BASE_PATH/jar
APPLICATION_PATH=$BASE_PATH/infra-subway-performance
LOG_PATH=$BASE_PATH/log
PROJECT_NAME=subway
IP=$(ifconfig -a | grep "inet " | grep "192" | awk '{print $2}')

clone_pull() {
        cd $BASE_PATH

        echo "> Git Clone"
        
        git config --global credential.helper cache

        git clone --recurse-submodules -b test2 --single-branch https://yoonmin-kim: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@github.com/yoonmin-kim/infra-subway-performance
                
        cd $APPLICATION_PATH
        
        echo "> Git Pull"
        
        git pull
}

redis_start() {
        sudo docker pull redis

        sudo docker run -d -p 6379:6379 redis
}

build() {
        cd $APPLICATION_PATH

        ./gradlew -x test clean build

        echo "> 프로젝트 Build 완료"

        mkdir $JAR_PATH

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
                        sudo kill -15 $CURRENT_PID
                        sleep 5
        fi
}

deploy() {
        echo "> 새 애플리케이션 배포"

        JAR_NAME=$(ls $JAR_PATH | grep subway.*.jar)

        echo "> JAR Name: $JAR_NAME"

        cd $JAR_PATH

        mkdir $LOG_PATH

        nohup java -Dserver.port=8080 \
                        -Dspring.profiles.active=prod \
                        -Djava.security.egd=file:/dev/./urandom \
                        -jar $JAR_PATH/$JAR_NAME 1> $LOG_PATH/application.log 2>&1  &

        echo "> 애플리케이션 실행 완료"
}

clone_pull
redis_start
build
check_process
deploy