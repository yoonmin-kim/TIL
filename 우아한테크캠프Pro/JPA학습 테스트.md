### @MappedSuperclass
* 엔티티별로 공통 필드가 존재하는 경우 불 필요한 중복 코드를 제거하기 위해 사용
* 별도로 생성할 일이 없다면 추상 클래스로 작성하자

### save()의 비밀
* isNew() 메소드에 의해 Id 값이 없으면 em.persist() 호출
* Id값이 있으면 em.merge() 호출
  * 해당 Id 값으로 DB에 select 쿼리가 수행된다

### 메소드명으로 카운트, exists 쿼리 생성 가능
* countByName()
* existsByName()

### 준영속 엔티티를 비교할 경우 equals() hashCode() 를 활용하자
* <a href="https://velog.io/@park2348190/JPA-Entity%EC%9D%98-equals%EC%99%80-hashCode">링크</a>