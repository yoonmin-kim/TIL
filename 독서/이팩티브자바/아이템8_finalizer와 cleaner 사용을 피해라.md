* finalizer는 예측할 수 없고, 상황에 따라 위험할 수 있어 일반적으로 불필요하다
* cleaner는 finalizer보다 덜 위험하지만, 여전히 예측할 수 없고, 느리고, 일반적으로 불필요하다
* finalizer와 cleaner는 즉시 수행된다는 보장이 없다
  * 객체에 접근할 수 없게 된 후 finalizer나 cleaner가 실행되기까지 얼마나 걸릴지 알 수 없다
* 즉, finalizer와 cleaner로는 제때 실행되어야 하는 작업은 절대 할 수 없다
  * 예를들어 파일 닫기를 finalizer나 cleaner에 맡기면 중대한 오류를 일으킬 수 있다
  * 시스템이 동시에 열 수 있는 파일 개수에 한계가 있기 때문이다
* finalizer나 cleaner를 얼마나 신속히 수행할지는 전적으로 가비지 컬렉터 알고리즘에 달렸으며,<br>
이는 가비지 컬렉터 구현마다 천차 만별이다
* finalizer 동작중 발생하는 예외는 무시되며, 처리할 작업이 남았더라도 그 순간 종료된다
* finalizer와 cleaner는 심각한 성능 문제도 동반한다
  * 간단한 AutoCloseable 객체를 생성하고 가비지 컬렉터가 수거하기 까지 12ns가 걸린반면(try-with-resouces)<br>
  finalizer를 사용하면 550ns가 걸렸다
* finalizer를 사용한 클래스는 finalizer 공격에 노출되어 심각한 보안 문제를 일으킬 수도 있다
  * final이 아닌 클래스를 finalizer공격으로부터 방어하려면 아무 일도 하지 않는 finalize 메서드를 만들고 final로 선언하자