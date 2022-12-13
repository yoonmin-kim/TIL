### Credential 정보 저장
* credential.helper의 store 옵션을 주게되면 해당 git directory에선 반영구적으로 인증 절차가 생략됩니다.(저장된 credential 정보를 이용해 인증 처리)
```sh
$ git config credential.helper store
$ git config credential.helper store --global # 모든 프로젝트에 적용
```

### 캐시 저장
* 임시로 일정 시간동안 저장하기에는 cache 가 더욱 유용하다. cache 옵션을 주게되면 기본적으로 15분 동안 인증 절차를 요구하지 않는다
* 시간은 timeout 옵션으로 지정해줄 수 있다. (초 단위이며 아래와 같이 지정 시 3600초, 즉 1시간의 유효시간을 가진다)
```sh
$ git config credential.helper 'cache --timeout=3600'
```