* @Override 애너테이션은 악명높은 버그들을 예방해준다
* 다음은 버그가 발생하는 예제이다. @Override를 달았다면 예방할 수 있다
```java
public class Bigram {
    private final first;
    private final second;

    public Bigram(char first, char second) {
        this.first = first;
        this.second = second;
    }

    public boolean equals(Bigram b) {
        return b.first == first && b.second = second;
    }

    public int hashCode() {
        return 31 * first + second;
    }

    public static void main(String[] args) {
        Set<Bigram> s = new HashSet<>();
        for (int i=0 ; i<10; i++) {
            for (char ch ='a'; ch<='z'; ch++) {
                s.add(new Bigram(ch, ch));
            }
        }
        System.out.println(s.size());
    }
}
```

* 26을 출력해야 할 것 같지만 260을 출력한다
* equals()와 hashCode()까지 재정의 했지만, equals()메서드가 Object의 euqals()를 재정의 한 것이 아니다

```
재정의한 모든 메서드에 @Override 애너테이션을 의식적으로 달면 실수했을때 컴파일러가
바로 알려줄 것이다. 예외는 한 가지뿐이다. 구체 클래스에서 상위 클래스의 추상 메서드를 재정의
한 경우엔 이 애너테이션을 달지 않아도 된다.(단다고 해서 해로울 것도 없다.)
```