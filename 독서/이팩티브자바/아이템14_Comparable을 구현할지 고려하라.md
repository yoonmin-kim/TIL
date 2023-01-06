* Comparable 인터페이스의 유일 무이한 메서드인 compareTo는 단순 동치성 비교에 더해<br>
순서까지 보장할 수 있으며, 제네릭 하다
* Comparable 을 구현하여 이 인터페이스를 활용하는 수많은 제네릭 알고리즘과 컬렉션의 힘을 누릴 수 있다
* 알파벳, 숫자, 연대 같이 순서가 명확한 값 클래스를 작성한다면 반드시 Comparable을 구현하자
* compareTo 메서드의 일반 규약은 equals 규약과 비슷하다
```
이 객체와 주어진 객체의 순서를 비교한다.이 객체가 주어진 객체보다 작으면 음의 정수를,
같으면 0을, 크면 양의 정수를 반환한다. 비교할 수 없는 타입의 객체가 주어지면 ClassCastException을 던진다

- Comparable을 구현한 클래스는 모든 x, y에 대해 sgn(x.compareTo(y)) == -sgn(y.compareTo(x))여야 한다
(따라서 x.compareTo(y)는 y.compareTo(x)가 예외를 던질 때에 한해 예외를 던져야 한다)

- Comparable을 구현한 클래스는 추이성을 보장해야 한다. 즉, (x.compareTo(y) > 0 && y.compareTo(z) > 0) 이면
x.compareTo(z) > 0 이다

- Comparable을 구현한 클래스는 모든 z에 대해 x.compareTo(y) == 0 이면 sgn(x.compareTo(z)) == sgn(y.compareTo(z))다

- 이번 권고가 필수는 아니지만 꼭 지키는게 좋다. (x.compareTo(y) == 0) == (x.equals(y))여야 한다
Comparable을 구현하고 이 권고를 지키지 않는 모든 클래스는 그 사실을 명시해야 한다
```

* compareTo 메서드에서 필드의 값을 비교할 때 <와 > 연산자는 쓰지 말아야 한다
* 대신 박싱 된 기본 타입 클래스가 제공하는 정적 compare 메서드나 Comparator 인터페이스가 제공하는 비교자 생성 메서드를 사용하자