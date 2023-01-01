* 자원닫기는 클라이언트가 예측할 수 없는 성능 문제로 이어지기도 한다
* 자원 중 상당수가 안전망으로 finalizer를 활용하고 있지만 finalizer는 그리 믿을만 하지 못하다(아이템8)
* 전통적으로 자원의 제대로 닫힘을 보장하기 위해 try-finally 를 사용한다
* 다음과 같은 파일의 열고 닫는 코드를 실행하던 도중 try문에서 서버의 물리적인 문제가 발생한다면<br>
finally 문에서의 close()도 try문의 readLine() 처럼 제대로 수행되지 못한다

```java
static void copy(String path) {
    BufferedReader br = new BufferedReader(new FileReader(path));
    try {
        return br.readLine();
    } finally {
        br.close();
    }
}
```

* 이런 경우 두번째 예외가 첫번째 예외를 집어 삼켜버린다
* 개발자 입장에서는 처음 발생한 예외를 보고싶어할 경우가 많기 때문에 디버깅에 어려움을 초래한다
* 자바7에서 추가된 try-with-resources 를 사용하면 코드도 깔끔해지고 위와 같은 문제도 해결된다
* 첫번째 예외를 출력해줌과 동시에 두번째 예외도 예외 스택에 포함시켜준다
* AutoCloseable 인터페이의 close() 메소드만 구현해주면 알아서 close()를 호출해준다