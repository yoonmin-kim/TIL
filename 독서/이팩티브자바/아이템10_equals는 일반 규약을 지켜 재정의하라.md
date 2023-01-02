### equals 메서드를 재정의할 때는 반드시 일반 규약을 따라야 한다. 다음은 Object 명세에 적힌 규약이다
* 반사성(reflexivity): null이 아닌 모든 참조 값 x에 대해, x.equals(x)는 true다
* 대칭성(symmetry): null이 아닌 모든 참조 값 x, y에 대해, x.equals(y)가 true면 y.equals(x)도 true다
* 추이성(transitivity): null이 아닌 모든 참조 값 x, y, z에 대해, x.equals(y)가 true이고 y.equals(z)도 true면 x.equals(z)도 true다
* 일관성(consistency): null이 아닌 모든 참조 값 x, y에 대해 x.equals(y)를 반복해서 호출하면 항상 true를 반환하거나 false를 반환한다
* null-아님: null이 아닌 모든 참조 값 x에 대해 x.equals(null)은 false다

### 양질의 equals 메서드 구현 방법 단계별 정리
1. == 연산자를 사용해 입력이 자기 자신의 참조인지 확인한다
2. instanceof 연산자로 입력이 올바른 타입인지 확인한다
3. 입력을 올바른 타입으로 형변환한다
4. 입력 객체와 자기 자신의 대응되는 '핵심'필드들이 모두 일치하는지 하나씩 검사한다