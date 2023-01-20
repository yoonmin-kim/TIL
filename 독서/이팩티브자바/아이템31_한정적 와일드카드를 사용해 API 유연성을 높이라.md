* 유연성을 극대화하려면 원소의 생산자나 소비자용 입력 매개변수에 와일드카드 타입을 사용하라
* PECS, producer-extends, consumer-super
```java
// E 생산자(producer) 매개변수에 와일드카드 타입 적용
public void pushAll(Iterable<? extends E> src) {
    for(E e: src) {
        push(e);
    }
}

// E 소비자(consumer) 매개변수에 와일드카드 타입 적용
public void popAll(Collection<? super E> dst) {
    while (!isEmpty()) {
        dst.add(pop());
    }
}
```

* 반환 타입에는 한정적 와일드카드 타입을 사용하면 안된다
  * 유연성을 높여주기는커녕 클라이언트 코드에서도 와일드카드 타입을 써야 하기 때문이다
* 클래스 사용자가 와일드카드 타입을 신경써야 한다면 그 API에 무슨 문제가 있을 가능성이 크다
* 메서드 선언에 타입 매개변수가 한 번만 나오면 와일드카드로 대체하라
  * 비한정적 타입 매개변수라면 비한정적 와일드카드로 바꾸고, 한정적 타입 매개변수라면 한정적 와일드카드로 바꾸면된다