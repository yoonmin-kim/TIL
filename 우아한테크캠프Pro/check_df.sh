#!/bin/bash
BASE_PATH=/home/ubuntu/nextstep
APPLICATION_PATH=$BASE_PATH/infra-subway-deploy
LOG_PATH=$BASE_PATH/log
BRANCH=step2

function check_df() {
  git fetch
  master=$(git rev-parse $BRANCH)
  remote=$(git rev-parse origin/$BRANCH)

  if [[ $master == $remote ]]; then
    cd $BASE_PATH
    echo "$(date) 리모트 브랜치에 아무런 변경이 없습니다.😫" >> $LOG_PATH/check_df_log.txt
    exit 0
  else
    cd $BASE_PATH
    echo "$(date) 프로젝트가 갱신되었습니다." >> $LOG_PATH/check_df_log.txt
    $BASE_PATH/deploy.sh
    exit 0
  fi
}

cd $APPLICATION_PATH
check_df