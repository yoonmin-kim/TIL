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
