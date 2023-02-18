* 반복자와 인덱스 변수는 코드를 지저분하게 할뿐 우리가 진짜 필요한건 원소들뿐이다
* 반복자를 사용하여 중첩for문을 사용하면 버그가 날 가능성이 있다
```java
// 버그발생 코드 - next()가 여러번 불림
for (Iterator<Suit> i = suits.iterator(); i.hasNext(); )
    for (Iterator<Rank> j = ranks.iterator(); j.hasNext(); )
        deck.add(new Card(i.next(), j.next()));
```
* for-each문을 사용할 수 없는 상황 세가지
1. 파괴적인 필터링(destructive filtering): 컬렉션을 순회하면서 선택된 원소를 제거해야 한다면 반복자의 remove를 호출해야한다
2. 변형(transforming): 리스트나 배열을 순회하면서 그 원소의 값 일부 혹은 전체를 교체해야 한다면 반복자나 인덱스를 사용해야한다
3. 병렬 반복(parallel iteration): 여러 컬렉션을 병렬로 순회해야 한다면 각각의 반복자와 인덱스 변수를 사용해 엄격하고 명시적으로 제어해야 한다

```
전통적인 for문과 비교했을때 for-each문은 명료하고, 유연하고, 버그를 예방해준다.
성능 저하도 없다. 가능한 모든 곳에서 for문이 아닌 for-each문을 사용하자.
```