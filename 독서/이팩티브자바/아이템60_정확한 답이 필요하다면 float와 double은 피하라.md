* float와 double 타입은 과하과 공학 계산용으로 설계되었다.
  * 이진 부동소수점연산에 쓰이며, 넓은 범위의 수를 빠르게 정밀한 '근사치'로 계산하도록 세심하게 설계 되었다.
  * float와 double 타입은 특히 금융 관련 계산과는 맞지 않는다
```java
// 오류발생! 금융 계산에 부동소수 타입을 사용했다
@Test
    void error_calculate() {
        double funds = 1.00;
        int itemsBought = 0;
        for (double price = 0.10; funds >= price; price += 0.10) {
            funds -= price;
            itemsBought++;
        }
        System.out.println(funds);
    }
// 결과는 0.3999999999999999
```

```
정확한 답이 필요한 계산에는 float나 double을 피하라. 소수점 추적은 시스템에 맡기고, 코딩 시의 불편함이나 성능 저하를 신경 쓰지
않겠다면 BigDecimal을 사용하라. BigDecimal이 제공하는 여덟 가지 반올림 모드를 이용하여 반올림을 완벽히 제어 할 수 있다.
법으로 정해진 반올림을 수행해야 하는 비즈니스 계산에서 아주 편리한 기능이다. 반면, 성능이 중요하고 소수점을 직접 추적할 수 있고
숫자가 너무 크지 않다면 int나 long을 사용하라. 숫자를 아홉자리 십진수로 표현할 수 있다면 int를 사용하고, 열여덟 자리 십진수로
표현할 수 있다면 long을 사용하라. 열여덟 자리를 넘어가면 BigDecimal을 사용해야 한다.
```