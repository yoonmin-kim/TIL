* 배열이나 리스트에서 원소를 꺼낼때 ordinal메서드로 인덱스를 얻는 코드가 있다
```java
Set<Plant>[] plantsByLifeCycle = (Set<Plant>[]) new Set[Plant.LifeCycle.values().length];
for (int i=0; i < plantsByLifeCycle.length; i++) {
    plantsByLifeCycle[i] = new HashSet<>();
}    

for (Plant p : garden) {
    plantsByLifeCycle[p.lifeCycle.ordinal()].add(p);
}

// 결과 출력
for (int i=0; i < plantsByLifeCycle.length; i++) {
    System.out.printf("%s: %s%n", Plant.LifeCycle.values()[i], plantsByLifeCycle[i]);
}

```
* 배열은 제네릭과 호환되지 않으니 비검사 형변환을 수행해야 하고 깔끔히 컴파일 되지 않는다
* 배열은 각 인덱스의 의미를 모르니 출력 결과에 직접 레이블을 달아야한다
* 정확한 정숫값을 사용한다는 것을 우리가 직접 보증해야 한다
  * 잘못된 값을 사용하면 잘못된 동작을 수행하거나 (운이 좋다면)ArrayIndexOutOfBoundsException을 던질것이다

<hr>

* EnumMap을 사용해 데이터와 열거 타입을 매핑하자
```java
Map<Plant.LifeCycle, Set<Plant>> plantsByLifeCycle = new EnumMap<>(Plant.LifeCycle.class);
for (Plant.LifeCycle lc : Plant.LifeCycle.values()) {
    plantsByLifeCycle.put(lc, new HashSet<>());
}

for (Plant p : garden) {
    plantsByLifeCycle.get(p.lifeCycle).add(p);
}

System.out.println(plantsByLifeCycle);
```