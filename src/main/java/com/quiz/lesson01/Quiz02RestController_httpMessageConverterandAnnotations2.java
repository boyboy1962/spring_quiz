package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Quiz02RestController_httpMessageConverterandAnnotations2 {
	
//	SpringQuiz 프로젝트에 문제를 푸세요.
//	RestController 어노테이션을 활용해서 문제를 푸세요.
	
//	1. json 출력 (List, Map)
//	영화 정보를 저장한 json을 List와 Map을 활용해서 아래와 같이 출력하세요.
//	요청 URL : http://localhost:8080/lesson01/quiz02/1
//	출력예시(http://marondal.com/material/images/dulumary/web/springLifeCycle/test02_1_result.png)
	
	@RequestMapping("/1")
	public List<Map<String, Object>> printListMap(){
		List <Map<String, Object>> list = new ArrayList<>();
		Map <String, Object> map  = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		list.add(map);
		
		map = new HashMap<>();		
		map.put("rate", 0);
		map.put("director", "로베르코 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		list.add(map);

		map = new HashMap<>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		list.add(map);
		
		map = new HashMap<>();	
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "번죄와의 전쟁 : 나쁜놈들 전성시대");
		list.add(map);

		map = new HashMap<>();	
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		list.add(map);
		
		return list;
		
	}
	
//	2. json 출력 (List, Class)
//	게시판 내용을 저장한 json을 List 와 Class 를 설계하고 활용해서 아래와 같이 출력하세요.
//	요청 URL : http://localhost:8080/lesson01/quiz02/2
//	출력 예시(http://marondal.com/material/images/dulumary/web/springLifeCycle/test02_2_result.png)
	
	@RequestMapping("/2")
	public List<Data02> printListClass(){
		List <Data02> list = new ArrayList<>();	// A
		Data02 data = new Data02();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		list.add(data);
		
		data = new Data02();					// B
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘은 목요일이었어... 금요일인줄");
		list.add(data);
		
		data = new Data02();					// C
		data.setTitle("오늘 데이트한 이야기 해드릴게요");
		data.setUser("dulumary");
		data.setContent("....");
		list.add(data);
		
		return list;	
	}
	
//	3. ResponseEntity
//	아래와 같이 게시글 내용을 하나만 json 으로 출력하세요.
//	ResponseEntity 를 이용해서 HttpStatus.INTERNAL_SERVER_ERROR 로 상태 코드를 전달하세요.
//	출력 예시	(http://marondal.com/material/images/dulumary/web/springLifeCycle/test02_3_result.png)
//			(http://marondal.com/material/images/dulumary/web/springLifeCycle/test02_3_result.png)


	@RequestMapping("/3")
	public ResponseEntity<Data02> printEntity(){
		Data02 data = new Data02();
		
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		
		
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
}
