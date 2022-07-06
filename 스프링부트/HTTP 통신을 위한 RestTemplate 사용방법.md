* 참고 : https://www.youtube.com/watch?v=PfJQnbyAAhY&ab_channel=%EC%96%B4%EB%9D%BC%EC%9A%B4%EB%93%9C%ED%97%88%EB%B8%8C%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4-AroundHubStudio

## RestTemplate이란?
* 스프링에서 제공하는 HTTP 통신 기능을 쉽게 사용할 수 있게 설꼐되어 있는 템플릿
* HTTP서버와의 통신을 단순화하고 RESTful 원칙을 지킴
* 동기 방식으로 처리되며, 비동기 방식으로 AsyncRestTemplate가 있다
* RestTemplate 클래스는 REST 서비스를 호출하도록 설계되어 HTTP 프로토콜의 메소드에 맞게 여러 메소드를 제공
___
* 대표적인 메소드정리

Method|HTTP|설명
-|-|-
getForObject|GET|GET형식으로 요청하여 객체로 결과를 반환 받음
getForEntity|GET|GET형식으로 요청하여 ResponseEntity로 결과를 반환 받음
postForObject|POST|POST형식으로 요청하여 객체로 결과를 반환 받음
postForEntity|POST|POST형식으로 요청하여 ResponseEntity로 결과를 반환 받음
delete|DELETE|DELETE형식으로 요청
put|PUT|PUT형식으로 요청
patchForObject|PATCH|PATCH형식으로 요청
exchange|any|HTTP헤더를 생성하여 추가할 수 있고 어떤 형식에서도 사용할 수 있음
___

```java
/*
 * 소스예제
*/
@Service
public class RestTemplateServiceImpl implements RestTemplateService {

    private final Logger LOGGER = LoggerFactory.getLogger(RestTemplateServiceImpl.class);

    @Override
    public String getAroundHub() {
        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/around-hub")
            .encode()
            .build()
            .toUri();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(uri, String.class);

        LOGGER.info("status code : {}", responseEntity.getStatusCode());
        LOGGER.info("body : {}", responseEntity.getBody());

        return responseEntity.getBody();
    }

    @Override
    public String getName() {

        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/name")
            .queryParam("name", "Flature")
            .encode()
            .build()
            .toUri();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(uri, String.class);

        LOGGER.info("status code : {}", responseEntity.getStatusCode());
        LOGGER.info("body : {}", responseEntity.getBody());

        return responseEntity.getBody();
    }

    @Override
    public String getName2() {
        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/path-variable/{name}")
            .encode()
            .build()
            .expand("Flature") // 복수의 값을 넣어야할 경우 , 를 추가하여 구분
            .toUri();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(uri, String.class);

        LOGGER.info("status code : {}", responseEntity.getStatusCode());
        LOGGER.info("body : {}", responseEntity.getBody());

        return responseEntity.getBody();
    }

    @Override
    public ResponseEntity<MemberDTO> postDto() {
        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/member")
            .queryParam("name", "Flature")
            .queryParam("email", "jjj@jjj.com")
            .queryParam("organization", "Around Hub Studio")
            .encode()
            .build()
            .toUri();

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setName("flature!!");
        memberDTO.setEmail("aaa@aaa.com");
        memberDTO.setOrganization("Around Hub Studio!!");

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<MemberDTO> responseEntity = restTemplate.postForEntity(uri, memberDTO,
            MemberDTO.class);

        LOGGER.info("status code : {}", responseEntity.getStatusCode());
        LOGGER.info("body : {}", responseEntity.getBody());

        return responseEntity;
    }

    @Override
    public ResponseEntity<MemberDTO> addHeader() {
        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/add-header")
            .encode()
            .build()
            .toUri();

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setName("flature");
        memberDTO.setEmail("jjj@jjj.com");
        memberDTO.setOrganization("Around Hub Studio");

        RequestEntity<MemberDTO> requestEntity = RequestEntity
            .post(uri)
            .header("around-header", "Around Hub Studio")
            .body(memberDTO);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<MemberDTO> responseEntity = restTemplate.exchange(requestEntity,
            MemberDTO.class);

        LOGGER.info("status code : {}", responseEntity.getStatusCode());
        LOGGER.info("body : {}", responseEntity.getBody());

        return responseEntity;
    }
}
```