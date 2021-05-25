package com.jckang.ex02.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/*
테스트 코드는 기존과 좀 다르게 진행되는데 그 이유는 웹을 개발할 때 매번 URL을 테스트하기 위해서 Tomcat과 같은 WAS를 실행하는
불편한 단계를 생략하기 위해서입니다. 스프링의 테스트 기능을 활용하면 개발 당시에 Tomcat(WAS)을 실행하지 않고도 스프링과 웹
URL을 테스트 할 수 있습니다.
WAS를 실행하지 않기 위해서는 약간의 추가적인 코드가 필요하지만, 반복적으로 서버를 실행하고 화면에 입력하고, 오류를 수정하는
단계를 줄여줄 수 있기 때문에 Controller를 테스트할 때는 한 번쯤 고려해볼 만한 방식입니다.
*/

@ExtendWith(SpringExtension.class)
/*
 * @WebAppConfiguration은 Servlet의 ServletContext를 이용하기 위해서인데, 스프링에서는
 * WebApplicationContext라는 존재를 이용하기 위해서입니다. @BeforeEach 어노테이션이 적용된 setUp()에서는
 * import할 때 JUnit을 이용해야 합니다. @BeforeEach가 적용된 메서드는 모든 테스트 전에 매번 실행되는 메서드가 됩니다.
 */
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j2
public class BoardControllerTests {
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	/*
	 * MockMvc는 말 그대로 '가짜 mvc'라고 생각하면 됩니다. 가짜로 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서
	 * Controller를 실행해 볼 수 있습니다. testList()는 MockMvcRequestBuilders라는 존재를 이용해서 GET
	 * 방식의 호출을 합니다. 이후에는 BoardController의 getList()에서 반환된 결과를 이용해서 Model에 어떤 데이터들이
	 * 담겨 있는지 확인합니다. Tomcat을 통해서 실행되는 방식이 아니므로 기존의 테스트 코드를 실행하는 것과 동일하게 실행합니다.
	 */
	private MockMvc mockMvc;

	@BeforeEach
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	}

	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register").param("title", "테스트 새글 제목")
						.param("content", "테스트 새글 내용").param("writer", "user00"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "2")).andReturn()
				.getModelAndView().getModelMap());
	}

	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "1").param("title", "수정된 테스트 새글 제목")
						.param("content", "수정된 테스트 새글 내용").param("writer", "muser00"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "2")).andReturn()
				.getModelAndView().getViewName();
		log.info(resultPage);
	}
	/*
	 * 경우에 따라서는 Controller에 대한 테스트 코드를 작성하는 것에 대해서 거부감을 가지는 경우도 많습니다. 대부분은 일정에 여유가
	 * 없다는 이유로 테스트를 작성하지 않는 경우가 많은데 프로젝트를 진행하는 멤버들의 경험치가 낮을수록 테스트를 먼저 진행하는 습관을 가지는
	 * 것이 좋습니다. 반복적으로 입력과 수정, WAS의 재시작 시간을 고려해보면 Controller에 대한 테스트를 진행하는 선택이 더 빠른
	 * 개발의 결과를 낳는 경우가 많습니다.
	 */
}
