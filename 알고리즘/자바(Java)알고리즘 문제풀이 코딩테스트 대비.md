### 대소문자 변환
- Character
  - isLowerCase(): 소문자인지 여부
  - isUpperCase(): 대문자인지 여부
  - toLowerCase(): 소문자로 변환
  - toUpperCase(): 대문자로 변환
```java
for(char ch : str.toCharArray()){
    if(Character.isLowerCase(ch)){
        builder.append(Character.toUpperCase(ch));
    }
    if (Character.isUpperCase(ch)) {
        builder.append(Character.toLowerCase(ch));
    }
}
```

### 최대길이의 문장 찾기
- String
  - split(): delimeter를 기준으로 잘라내어 문자열배열로 반환
  - indexOf(): 해당 문자에 해당하는 위치 반환
  - substring(): 
    - 파라미터1개 - 해당 위치까지 잘라내고 다음 위치부터 문자의 끝까지 반환
    - 파라미터2개 - 시작 위치부터 (해당위치-1)까지 잘라내어 반환
  
```java
/*
 * 공백을 기준으로 잘라서 각각의 길이를 구하여 해결
 */
private String solution(String str) {
	String[] split = str.split(" ");
	int max = 0;
	for (int i = 0; i < split.length; i++) {
		if (split[max].length() < split[i].length()) {
			max = i;
		}
	}
	return split[max];
}

/*
 * 공백까지 길이구하고 길이를 구한 대상에 해당하는 문자 잘라내고 
 * 나머지 문자에 대해서 다시 공백까지 길이구하고
 */
private String solution2(String str) {
	int pos = 0;
	int max = Integer.MIN_VALUE;
	String result = str;
	while ((pos = str.indexOf(" ")) != -1) {
		if (pos > max) {
			max = pos;
			result = str.substring(0, pos + 1);
		}
		str = str.substring(pos + 1);
	}
	if (str.length() > max) {
		result = str;
	}

	return result;
}
```

### 단어 뒤집기
- StringBuilder 이용
```java
private String solution(String str) {
		StringBuilder builder = new StringBuilder();
		for (int i = str.length() - 1; i > -1; i--) {
			builder.append(str.charAt(i));
		}

		return builder.toString();
	}

private String solution2(String str) {
		StringBuilder builder = new StringBuilder(str).reverse();
		return builder.toString();
	} 
```
- 직접 뒤집기
```java
private String solution3(String str) {
	char[] chars = str.toCharArray();
	int lt = 0;
	int rt = chars.length - 1;
	while (lt < rt) {
		char tmp = chars[lt];
		chars[lt] = chars[rt];
		chars[rt] = tmp;
		lt++;
		rt--;
	}
	return String.valueOf(chars);
}
```
- 특정문자 뒤집기(알파벳일때만, 특수문자 건너뛰기)
```java
private String solution(String str) {
	char[] chars = str.toCharArray();
	int lt = 0;
	int rt = str.length() - 1;
	while (lt < rt) {
		char left = chars[lt];
		char right = chars[rt];

		if (!Character.isAlphabetic(left)) {
			lt++;
		}

		if (!Character.isAlphabetic(right)) {
			rt--;
		}

		if (Character.isAlphabetic(left) && Character.isAlphabetic(right)) {
			char temp = chars[lt];
			chars[lt] = chars[rt];
			chars[rt] = temp;
			lt++;
			rt--;
		}

	}

	return String.valueOf(chars);
}
```

### 중복문자제거
```java
private String solution(String str) {
	List<Character> dupCheckList = new ArrayList<>();
	char[] chars = str.toCharArray();
	StringBuilder result = new StringBuilder();
	for (char aChar : chars) {
		if (!dupCheckList.contains(aChar)) {
			dupCheckList.add(aChar);
			result.append(aChar);
		}
	}

	return result.toString();
}

/*
 * indexOf 사용, 해당문자가 처음 발견된 위치와 현재 문자의 위치가 같을 경우 결과에 추가
 */
private String solution2(String str) {
	StringBuilder result = new StringBuilder();
	for (int i = 0; i < str.length(); i++) {
		char c = str.charAt(i);
		if (str.indexOf(c) == i) {
			result.append(c);
		}
	}

	return result.toString();
}
```

### 회문문자열
- 앞뒤가 같은문자인지 체크
- 예) gooG, stuTs

```java
private String solution(String str) {
	str = str.toLowerCase();
	StringBuilder builder = new StringBuilder(str).reverse();
	String s2 = builder.toString().toLowerCase();

	if (str.equals(s2)) {
		return "YES";
	}

	return "NO";
}

private String solution2(String str) {
	str = str.toLowerCase();
	int len = str.length();
	for (int i = 0; i < len / 2; i++) {
		if (str.charAt(i) != str.charAt(len - 1 - i)) {
			return "NO";
		}
	}
	return "YES";
}
```

### 유효한 팰린드롬
```java
/**
 * 정규식을 이용해서 알파벳이 아닌 문자는 제거
 */
private String solution2(String str) {
	String s = str.toUpperCase().replaceAll("[^A-Z]", "");
	String tmp = new StringBuilder(s).reverse().toString();
	if (s.equals(tmp)) {
		return "YES";
	}

	return "NO";
}
```

### 숫자만 추출
```java
private int solution(String str) {
	String s = str.replaceAll("[^0-9]", "");
	return Integer.parseInt(s);
}

private int solution2(String str) {
	int answer = 0;
	char[] chars = str.toCharArray();
	for (char aChar : chars) {
		if (aChar >= 48 && aChar <= 57) {
			answer = answer * 10 + (aChar - 48);
		}
	}
	return answer;
}
```

### 가장 짧은 문자거리
```java
private String solution(String s, char t) {
	String question = s;
	char find = t;
	StringBuilder answer = new StringBuilder();

	// target의 위치를 먼저찾는다
	List<Integer> index = new ArrayList<>();
	for (int i = 0; i < question.length(); i++) {
		if (question.charAt(i) == find) {
			index.add(i);
		}
	}
	
	// target과 거리를 측정한다
	for (int j = 0; j < question.length(); j++) {
		if (question.charAt(j) == find) {
			answer.append("0");
		} else {
			int min = Integer.MAX_VALUE;
			for (int i : index) {
				min = Math.min(Math.abs(j - i), min);
			}
			answer.append(min);
		}
	}
	return answer.toString();
}

private int[] solution2(String s, char t) {
	int[] answer = new int[s.length()];
	int p = 1000;

	// 왼쪽 타겟을 기준으로 거리를 측정한다
	for (int i = 0; i < s.length(); i++) {
		if (s.charAt(i) == t) {
			p = 0;
		} else {
			p++;
		}
		answer[i] = p;
	}

	// 오른쪽 타겟을 기준으로 거리를 측정한다
	p = 1000;
	for (int j = s.length() - 1; j >= 0; j--) {
		if (s.charAt(j) == t) {
			p = 0;
		} else {
			p++;
		}
		answer[j] = Math.min(answer[j], p);
	}

	return answer;
}
```

### 문자열 압축
```java
/**
 * i-1과 i 비교 
 */
private String solution(String str) {
	StringBuilder answer = new StringBuilder();
	char[] chars = str.toCharArray();

	int dupCount = 1;
	for (int i = 0; i < chars.length; i++) {
		if (i == 0)
			continue;
		if (chars[i - 1] == chars[i]) {
			dupCount++;
			if (i == chars.length - 1) {
				answer.append(chars[i]).append(dupCount);
			}
		}

		if (chars[i - 1] != chars[i]) {
			answer.append(chars[i - 1]);
			if (dupCount != 1) {
				answer.append(dupCount);
				dupCount = 1;
			}
			if (i == chars.length - 1) {
				answer.append(chars[i]);
			}
		}

	}
	return answer.toString();
}

/**
 * i와 i+1비교
 */
private String solution2(String str) {
	str = str + " ";
	StringBuilder answer = new StringBuilder();

	int dupCount = 1;
	for (int i = 0; i < str.length() - 1; i++) {
		if (str.charAt(i) == str.charAt(i + 1)) {
			dupCount++;
		} else {
			answer.append(str.charAt(i));
			if (dupCount != 1) {
				answer.append(dupCount);
				dupCount = 1;
			}
		}
	}
	return answer.toString();
}
```

### 암호해독
- replace() 이용하여 문자치환
- substring() 이용하여 문자열스플릿
- Integer.parseInt() 이용하여 이진수 문자열 10진수로 변환
```java
private String solution(int length, String str) {
	StringBuilder answer = new StringBuilder();
	for (int i = 0; i < length; i++) {
		String tmp = str.substring(0, 7);
		String s = tmp.replace('#', '1').replace('*', '0');
		int integer = Integer.parseInt(s, 2);
		answer.append((char)integer);
		str = str.substring(7);
	}
	return answer.toString();
}
```

### 피보나치 수열
```java
// 배열 버전
private int[] solution(int loop) {
	int[] answer = new int[loop];

	for (int i = 0; i < loop; i++) {
		if (i == 0 || i == 1) {
			answer[i] = 1;
		} else {
			answer[i] = answer[i - 1] + answer[i - 2];
		}
	}
	return answer;
}

// 손코딩 버전
private void solution2(int loop) {
	int a = 1, b = 1, c;
	System.out.print(a + " " + b + " ");
	for (int i = 2; i < loop; i++) {
		c = a + b;
		System.out.print(c + " ");
		a = b;
		b = c;
	}
}
```

### 소수 구하기
* 에라토스 테네스체
* 2의배수 삭제, 3의배수 삭제, 5의배수 삭제를 진행해가며 주어진 범위까지 소수를 찾아낸다
```java
/**
 * 에라토스테네스 체
 */
private int solution(int end) {
	int answer = 0;
	int[] check = new int[end + 1];
	for (int i = 2; i < end + 1; i++) {
		if (check[i] == 0) {
			answer++;
			for (int j = i; j < end + 1; j += i) {
				check[j] = 1;
			}
		}
	}
	return answer;
}
```

### 점수계산
* 앞의 문제에 대해서는 답을 틀리다가 답이 맞는 처음 문제는 1점으로 계산한다.
* 또한, 연속으로 문제의 답이 맞는 경우에서 두 번째 문제는 2점, 세 번째 문제는 3점, ..., K번째 문제는 K점으로 계산한다. 
* 틀린 문제는 0점으로 계산한다.

```java
private int solution(String[] str) {
	int cnt = 0;
	int answer = 0;
	for (int i = 0; i < str.length; i++) {
	    if(str[i].equals("1")){
		cnt += 1;
		answer += cnt;
	    } else {
		cnt = 0;
	    }
	}

	return answer;
}
```

### 등수구하기
* 가장 높은 점수가 92점인데 92점이 3명 존재하면 1등이 3명이고 그 다음 학생은 4등이 된다
```java
private int[] solution(int[] str) {
	int rank[] = new int[str.length];

	for (int i = 0; i < str.length; i++) {
	    for (int j = 0; j < str.length; j++) {
		if (i==j) continue;
		if(str[i] < str[j]){
		    rank[i] = rank[i] + 1;
		}
	    }
	}

	return rank;
}
```

### 격자판 최대합
```java
private int solution(int[][] tmp) {
	int answer = 0;
	int row = 0;
	int col = 0;
	int upToDown = 0;
	int downToUp = 0;

	for (int i = 0; i < tmp.length; i++) {
		for (int j = 0; j < tmp.length; j++) {
			row += tmp[i][j];
			col += tmp[j][i];
			if (i == j) {
				upToDown += tmp[i][j];
			}
			if (i + j == tmp.length - 1) {
				downToUp += tmp[i][j];
			}
		}
		answer = Math.max(Math.max(row, col), answer);
		row = 0;
		col = 0;

	}
	answer = Math.max(Math.max(upToDown, downToUp), answer);
	return answer;
}
```
### 봉우리문제
```java
private int solution(int[][] tmp, int loop) {
	int answer = 0;

	for (int i = 0; i < loop; i++) {
		for (int j = 0; j < loop; j++) {
			if (tmp[i + 1][j + 1] > tmp[i][j + 1] &&
				tmp[i + 1][j + 1] > tmp[i + 2][j + 1] &&
				tmp[i + 1][j + 1] > tmp[i + 1][j] &&
				tmp[i + 1][j + 1] > tmp[i + 1][j + 2]) {
				answer += 1;
			}

		}
	}
	return answer;
}

private int solution2(int[][] tmp, int loop) {
	int answer = 0;
	int[] dx = {-1, 0, 1, 0};
	int[] dy = {0, 1, 0, -1};

	for (int i = 0; i < loop; i++) {
		for (int j = 0; j < loop; j++) {
			boolean flag = true;
			for (int k = 0; k < dx.length; k++) {
				if (tmp[i + 1][j + 1] < tmp[(i + 1) + dx[k]][(j + 1) + dy[k]]) {
					flag = false;
					break;
				}
			}
			if (flag) {
				answer += 1;
			}
		}
	}
	return answer;
}
```


### 임시반장 정하기
```java

### 임시반장 정하기
```java
private int solution(int[][] tmp, int loop) {
	int[] score = new int[loop];
	int max = 0;
	int answer = 0;

	for (int i = 0; i < loop; i++) {
		boolean[] dupCheck = new boolean[loop];
		for (int j = 0; j < 5; j++) {
			int student = tmp[i][j];
			for (int k = 0; k < loop; k++) {
				if (i == k)
					continue;
				if (dupCheck[k] == false && student == tmp[k][j]) {
					score[i] += 1;
					dupCheck[k] = true;
				}
			}
		}
	}
	for (int x = 0; x < loop; x++) {
		max = Math.max(max, score[x]);
	}
	for (int y = 0; y < loop; y++) {
		if (max == score[y]) {
			answer = y + 1;
			break;
		}
	}
	return answer;
}

private int solution2(int[][] tmp, int loop) {
	int answer = 0;
	int max = Integer.MIN_VALUE;
	for (int i = 0; i < loop; i++) {
		int cnt = 0;
		for (int j = 0; j < loop; j++) {
			for (int k = 0; k < 5; k++) {
				if (tmp[i][k] == tmp[j][k]) {
					cnt++;
					break;
				}
			}
		}
		if (cnt > max) {
			max = cnt;
			answer = i;
		}
	}

	return answer + 1;
}
```
### Two Pointers 알고리즘
```java
private List<Integer> solution2(int[] a, int[] b) {
	List<Integer> answer = new ArrayList<>();
	int p1 = 0, p2 = 0;

	while (p1 < a.length && p2 < b.length) {
		if (a[p1] < b[p2]) {
			answer.add(a[p1++]);
		} else {
			answer.add(b[p2++]);
		}
	}
	while (p1 != a.length || p2 != b.length) {
		if (p1 != a.length) {
			answer.add(a[p1++]);
		}
		if (p2 != b.length) {
			answer.add(b[p2++]);
		}
	}
	return answer;
}
```
### 슬라이딩윈도우
* 연속된 b 일 동안의 최대매출 구하기
```java
private int solution(int b, int[] c) {
	int answer = 0, tmp = 0;

	for (int i = 0; i < b; i++) {
		tmp += c[i];
	}

	int p1 = 0, p2 = p1 + b;
	while (p2 < c.length) {
		answer = Math.max(answer, tmp);
		tmp = tmp - c[p1] + c[p2];
		p1++;
		p2++;
	}

	return answer;
}
```

### 최대길이 연속 부분수열
```java
private int solution(int[] tmp, int limit) {
	int answer = 0;

	int cnt = 0, lt = 0;
	for (int rt = 0; rt < tmp.length; rt++) {
		if (tmp[rt] == 0)
			cnt++;
		while (cnt > limit) {
			if (tmp[lt] == 0)
				cnt--;
			lt++;
		}
		answer = Math.max(answer, rt - lt + 1);
	}

	return answer;
}
```
