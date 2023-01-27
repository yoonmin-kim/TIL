* 열거한 값들이 주로 집합으로 사용될 경우, 구닥다리 방법으로 정수 열거 패턴을 사용해 왔다
```java
public class Text {
    public static final int STYLE_BOLD = 1 << 0; // 1
    public static final int STYLE_BOLD = 1 << 1; // 2
    public static final int STYLE_BOLD = 1 << 2; // 4
    public static final int STYLE_BOLD = 1 << 3; // 8
    
    //매개변수 styles는 0개 이상의 STYLE_ 상수를 비트별 OR한 값이다
    public void applyStyles(int styles) {...}
}

text.applyStyles(STYLE_BOLD | STYLE_ITALIC); // 비트필드
```

* 정수 열거 상수의 단점을 그대로 지닌다
* 비트 필드 값이 그대로 출력되면 단순한 정수 열거 상수를 출력할 때보다 해석이 훨씬 어렵다
* 비트 필드 하나에 녹아있는 모든 원소를 순회하기도 까다롭다
* 최대 몇 비트가 필요한지 API작성시 미리 예측해야한다

* 현대적 기법으로 EnumSet을 사용하면 짧고 깔끔하다
```java
public class Text {
    public enum Style { BOLD, ITALIC, UNDERLINE, STRIKETHROUGH }
    
    // 어떤 Set을 넘겨도 되나, EnumSet이 가장 좋다.
    public void applyStyles(Set<Style> styles) {...}
}
```

```
열거할 수 있는 타입을 한데 모아 집합 형태로 사용한다고 해도 비트 필드를 사용할 이유는 없다.
EnumSet 클래스가 비트 필드 수준의 명료함과 성능을 제공하고 아이템34에서 설명한 열거 타입의
장점까지 선사하기 때문이다. EnumSet의 유일한 단점이라면 (자바 9까지는 아직)불변 EnumSet을
만들 수 없다는 것이다. 앞으로 릴리스에서 수정되리라 기대하며 그때까지 Collections.unmodifiableSet
으로 EnumSet을 감싸 사용할 수 있다.
```