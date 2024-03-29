* API를 올바로 문서화하려면 공개된 모든 클래스, 인터페이스, 메서드, 필드 선언에 문서화 주석을 달아야 한다
* 메서드용 문서화 주석에는 해당 메서드와 클라이언트 사이의 규약을 명료하게 기술해야 한다
  * how가 아닌 what을 기술해야 한다
* 한 클래스(혹은 인터페이스)안에서 요약 설명이 똑같은 멤버(혹은 생성자)가 둘 이상이면 안 된다
* 제네릭 타입이나 제네릭 메서드를 문서화할 때는 모든 타입 매개변수에 주석을 달아야 한다
* 열거 타입을 문서화 할 때는 상수들에도 주석을 달아야 한다
* 애너테이션 타입을 문서화할 때는 멤버들에도 모두 주석을 달아야 한다
* 클래스 혹은 정적 메서드가 스레드 안전하든 그렇지 않든, 스레드 안전 수준을 반드시 API설명에 포함해야 한다

* 클래스를 상속용으로 설계할때 @implSpec 태그로 자기사용 패턴에 대해서 문서에 남겨 올바로 재정의 하는<br>
방법을 알려줘야 한다
  * 자바 11까지도 자바독 명령줄에서 -tag "implSpec:a:Implementation Requirements:" 스위치를 켜주지<br>
  않으면 @implSpec 태그를 무시해버린다

```
문서화 주석은 API를 문서화하는 가장 훌륭하고 효과적인 방법이다. 공개 API라면
빠짐없이 설명을 달아야 한다. 표준 규약을 일관되게 지키자. 문서화 주석에 임의의
HTML태그를 사용할 수 있음을 기억하라. 단, HTML 메타문자는 특별하게 취급해야 한다.
```