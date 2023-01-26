* 열거 타입에서 몇 번째 위치인지를 반환하는 ordinal이라는 메서드를 제공한다
  * EnumSet, EnumMap 같이 열거 타입 기반의 범용 자료구조에 쓸 목적으로 설계되었다
* 절대 사용하지 말자!
```java
public enum Ensemble {
    SOLO, DUET, TRIO, QUARTET, QUINTET,
    SEXTET, SEPTET, OCTET, NONET, DECTET;

    public int numberOfMusicians() { return ordinal() + 1; }
}
```
* 상수 선언 순서 변경시 오동작
* 이미 사용중인 정수와 값이 같은 상수 추가 불가
* 값을 중간에 비울 수 없이 연속적으로 만들어야함, 때문에 더미 상수가 추가될 수 있음
* 인스턴스 필드를 사용하면 모든게 해결된다
```java
public enum Ensemble {
    SOLO(1), DUET(2), TRIO(3), QUARTET(4), QUINTET(5),
    SEXTET(6), SEPTET(7), OCTET(8), DOUBLE_QUARTET(8),
    NONET(9), DECTET(10), TRIPLE_QUARTET(12);

    private final int numberOfMusicians;
    Ensemble(int size) { this.numberOfMusicians = size; }
    public int numberOfMusicians() { return numberOfMusicians; }
}
```