### Array핵심
* 메모리상에 연속적, 순차적으로 저장된다.
* 미리 할당된 크기만큼 저장한다.
* Array와 Linked List의 가장 큰 차이점은 메모리에 저장되는 방식과
* operation의 연산 속도()이다.
```
- Array의 장점은 lookup과 append가 빠르다
- 조회를 자주하는 작업에 많이 쓰인다
- 단점은 미리 크기가 할당되어야 한다
- 따라서 추가적인 overhead가 발생할 수 있다
```
### 시간복잡도
| |Array|
|-|-|
|access|O(1)|
|append|O(1)|
|마지막원소 <br>delete|O(1)|
|insertion|O(n)|
|deletion|O(n)|
|search|O(n)|

### LinkedList 핵심
* Node라는 구조체로 이뤄졌다.
* Node는 데이터와 다음 주소값을 저장한다.
* 물리적인 메모리상 비연속적이다.
* 각 Node에 저장된 다음 주소값에 의해 논리적으로 연속성을 갖는다.
### 시간복잡도
||LinkedList|
|-|-|
|access|O(n)|
|search|O(n)|
|insertion|O(1)|
|deletion|O(1)|


### Array(dynamic) vs LinkedList
```java
List<String> strings = new ArrayList<>();
System.out.println("ArrayList 시작");
long start = System.currentTimeMillis();
for (int i = 0; i < 10000; i++) {
    strings.add("string" + i);
}
long end = System.currentTimeMillis();
System.out.println("세팅 걸린 시간="+(end-start)+"ms");
```
```java
LinkedList<String> list = new LinkedList<>();
System.out.println("LinkedList 시작");
long start = System.currentTimeMillis();
for (int i = 0; i < 10000; i++) {
    list.add("string" + i);
}
long end = System.currentTimeMillis();
System.out.println("세팅 걸린 시간="+(end-start)+"ms");
```
<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/66a1120f-8a1f-42c9-9958-8e336b8640c6/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220616T141435Z&X-Amz-Expires=86400&X-Amz-Signature=1443d8791da9269d28edc779655e1223d5fd9b3a218de7d2443a3ae0435acddd&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22&x-id=GetObject" width="400" height="150"/>

```java
System.out.println("ArrayList 시작");
for (int i = 0; i < 10000; i++) {
    strings.add("string" + i);
}

long start = System.currentTimeMillis();
for(int i=0; i<9999; i++){
    strings.remove(1);
}
long end = System.currentTimeMillis();
System.out.println("삭제 걸린 시간="+(end-start)+"ms");
```
```java
System.out.println("LinkedList 시작");
for (int i = 0; i < 10000; i++) {
    list.add("string" + i);
}

long start = System.currentTimeMillis();
for(int i=0; i<9999; i++){
    list.remove(1);
}
long end = System.currentTimeMillis();
System.out.println("삭제 걸린 시간="+(end-start)+"ms");
```
<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/082756da-c49a-4ab1-9409-d05a0c2709de/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220616T142406Z&X-Amz-Expires=86400&X-Amz-Signature=cefb5ba81933a43d3e5e5ee95971e62903c4bf24e31f8998d70321e57ef972cf&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22&x-id=GetObject" width="400" height="150"/>

```java
System.out.println("ArrayList 시작");
for (int i = 0; i < 10000; i++) {
    strings.add("string" + i);
}

long start = System.currentTimeMillis();
for(int i=0; i<9999; i++){
    strings.get(5000);
}
long end = System.currentTimeMillis();
System.out.println("찾기 걸린 시간="+(end-start)+"ms");
```
```java
System.out.println("LinkedList 시작");
for (int i = 0; i < 10000; i++) {
    list.add("string" + i);
}

long start = System.currentTimeMillis();
for(int i=0; i<9999; i++){
    list.get(5000);
}
long end = System.currentTimeMillis();
System.out.println("찾기 걸린 시간="+(end-start)+"ms");
```
<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/64ef98ae-6fc9-406a-8d22-781e01dd4975/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220616T144141Z&X-Amz-Expires=86400&X-Amz-Signature=1db8f9cf15325ea3a31c8c677eab54f3cfc966bace297eab001c85be05b354af&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22&x-id=GetObject" width="400" height="150">
