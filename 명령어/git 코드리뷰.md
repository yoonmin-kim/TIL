1. 미션시작버튼 클릭
* 본인의 미션 브랜치 생성

2. Fork
* 내 깃헙 저장소로 복사

3. 로컬로 Single branch 클론
```
git clone -b yoonmin-kim --single-branch https://github.com/yoonmin-kim/java-lotto-pro
```

4. 각 기능별 브랜치 생성
```
git checkout -b step1
```

5. 클론한 프로젝트 오픈후 JDK 버전에 맞게 세팅

6. 기능 구현 및 commit

7. 원격저장소에 push
```
git push origin step1
```

8. 머지가된것을 확인후 step1브랜치 삭제
```
git checkout yoonmin-kim <-- step1이 아닌 브랜치로 이동해야 step1 삭제 가능
git branch -D step1
```

9. next-step 저장소에 머지 된 소스를 바라볼 수 있도록 remote추가
```
git remote add upstream https://github.com/next-step/java-lotto-pro

(결과)
origin  https://github.com/yoonmin-kim/java-lotto-pro (fetch)
origin  https://github.com/yoonmin-kim/java-lotto-pro (push)
upstream        https://github.com/next-step/java-lotto-pro (fetch)
upstream        https://github.com/next-step/java-lotto-pro (push)
```
10. next-step 저장소에 yoonmin-kim 브랜치의 소스를 바라볼 수 있게 fetch
```
git fetch upstream yoonmin-kim
```

11. 10번과정 이후 소스를 동기화 하기 위해 rebase
```
git rebase upstream/yoonmin-kim
```

12. fork한 원격 저장소에 필요없는 브랜치 삭제
```
git push origin --delete step2
```