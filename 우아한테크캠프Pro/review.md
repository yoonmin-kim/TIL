### 일반 배열보다는 컬렉션 프레임워크를 적극적으로 활용하자
* 두번 이상의 프로퍼티 접근을 하지 말자는 얘기는 최소지식 원칙을 의미한다(의존관계 최소화)

<img src="./img/2.png">

### Junit 기능 중 null과 빈값을 지원해주는 기능이 있다
* @NullAndEmptySource
```java
@ParameterizedTest
@NullAndEmptySource
void null_empty(String data) {
    target = new Target(data);
    assertThat(target.target()).contains(0);
}
```

### 매직넘버를 사용하지 말고 상수를 통해 의미를 명확히 전달하자
<img src="./img/3.png">

### RuntimeException은 그 범위가 너무 크기 때문에 자식 클래스를 활용하여 좀 더 명확한 의미를 전달하자
* assertj 에서 제공하는 assertThatIllegalArgumentException() 를 테스트에 활용할 수 있다
```java
[기능]
public class PositiveNumberValidator implements CalculatorValidator {

    private static final Pattern NUMBER_PATTERN = Pattern.compile("^[0-9]+$");

    @Override
    public void validate(String target) {
        if (!NUMBER_PATTERN.matcher(target).matches()) {
            throw new IllegalArgumentException(ERROR_NUMBER_MESSAGE);
        }
    }
}

[테스트]
@ParameterizedTest
@ValueSource(strings = {"-1", "-2", "-3"})
void 음수라면_EX(String target) {
    assertThatIllegalArgumentException().isThrownBy(() -> validator.validate(target))
            .withMessageContaining(ERROR_NUMBER_MESSAGE);
}
```