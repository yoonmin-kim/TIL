## volatile
* 멀티스레드 환경에서 데이터의 값을 잘못 읽어들이는 경우가 발생할 수 있다
* 변수에 저장 된 값은 MM(Main-Memorry)에 저장된다
* 스레드는 변수의 값을 MM에서 CPU cache에 저장하여 읽고, 연산한다
* 따라서 MM에 저장 된 값을 변경하더라도 쓰레드에서 이미 캐시한 값은 변경된 값을 모른다
* 아래 예제는 메인 쓰레드에서 변수에 저장된 값을 변경하였음에도 별도 생성한 쓰레드에서 알아차리지 못하여 어플리케이션이 종료되지 못하는 상황을 구현하였다
```java
class VolatileTest extends Thread{
    boolean isAdd = true; // 이 부분은 volatile로 바꿔주면 정상 종료된다
    public void run() {
        int count=0;
        while(isAdd){
            count++;
        }
        System.out.prinlnt("Thread terminated." + coount);
    }

    public static void main(String args[]) throws InterruptedException {
        VolatileTest t = new VolatileTest();
        t.start();
        Thread.sleap(1000L);
        System.out.println("after sleeping in main");

        t.isAdd = false; //여기서 변수를 바꿨지만 종료되지 않는다
        t.join(); // 메인 쓰레드가 t쓰레드가 종료되기를 기다린다
        System.out.println("main Thread End..." + t.isAdd);
    }
}
```

## Automic
* volatile의 경우 읽기에 대해서 동기화를 지원하지만 연산에 대해서는 지원하지 않는다
* 이때 Automic을 사용하면 연산까지 동기화를 지원하게 된다
* 아래 예제에서는 5개의 쓰레드가 하나의 변수를 + 처리하게 되는데 각 쓰레드가 1만씩 + 연산을 처리하여 결과값이 5만이 나오기를 기대하는 예제이다
* volatile을 사용할 경우 5만이 채 되지 않는 값이 나오는 것을 확인할 수 있다
* Automic을 사용할 경우 연산에 대한 동기화까지 지원되어 5만이 나오는 것을 확인할 수 있다
```java
class Ojc extends Thread {
    public void run() {
        for (int i=0; i < 10000; i++) {
            AutomicTest.i = AutomicTest.i + 1;
        }
        System.out.println(this "::::END");
    }
}

public class AutomicTest {
    static AutomicInteger i = new AutomicInteger(0);
    volatile static int i = 0;
    public static void main(String args[]) throws InterruptedException {
        AutomicTest t = new AutomicTest();
        Ojc t1 = new Ojc();        Ojc t2 = new Ojc();
        Ojc t3 = new Ojc();        Ojc t4 = new Ojc();        Ojc t5 = new Ojc();
        t1.start();        t2.start();        t3.start();        t4.start();        t5.start();
        Thread.sleep(2000L);
        System.out.println(t.i);
    }
}
```