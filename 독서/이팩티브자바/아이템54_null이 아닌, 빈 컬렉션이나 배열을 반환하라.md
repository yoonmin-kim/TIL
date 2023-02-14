* 다음과 같이 재고가 없다고 null을 반환하게 되면 반환하는 입장에서도 코드가 지저분해지고<br>
 클라이언트 코드도 null을 처리하는 코드가 추가로 작성되어야 한다

```java
public List<Cheese> getCheese() {
    return cheeseInStock.isEmpty() ? null
        : new ArrayList<>(cheesesInStock);
}

// null처리를 해야하는 클라이언트 코드
List<Cheese> cheese = shop.getCheeses();
if (cheese != null && cheese.contains(Cheese.STILTON))
    System.out.println("좋았어, 바로 그거야");
```

* 때로는 빈 컨테이너를 할당하는 데도 비용이 드니 null을 반환하는 쪽이 낫다는 주장도 있다<br>
하지만 이는 두가지 면에서 틀린 주장이다
    1. 성능 분석 결과 이 할당이 성능 저하의 주범이라고 확인되지 않는 한, 이정도의 성능 차이는 신경 쓸 수준이 못 된다
    2. 빈 컬렉션과 배열은 굳이 새로 할당하지 않고도 반환할 수 있다
```java
// 빈 컬렉션을 매번 새로 할당하지 않도록 처리
public List<Cheese> getCheese() {
    return cheeseInStock.isEmpty() ? Collections.emptyList()
        : new ArrayList<>(cheesesInStock);
}

// 길이가 0일 수도 있는 배열 반환
public Cheese[] getCheeses() {
    return cheeseInStock.toArray(new Cheese[0]);
}
```

```
null이 아닌, 빈 배열이나 컬렉션을 반환하라.null을 반환하는 API는 사용하기 어렵고
오류 처리 코드도 늘어난다. 그렇다고 성능이 좋은 것도 아니다.
```