package test.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
// web.xml 에 필터 정의와 필터 맵핑을 어노테이션(@) 을 이용해서 할수있다.

/*
 * @WebFilter("/member/*") // 서버가 시작되는 시점에 web.xml 정의와 맵핑을 해준다.
 */public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// client가 로그인 했는지 여부를 확인
		// 부모 type 을 자식 type으로 casting 한 후
		HttpServletRequest req=(HttpServletRequest)request;
		
		//HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session=req.getSession();
		
		// 로그인 된 아이디가 있는지 얻어와본다.
		String id=(String)session.getAttribute("id");
		if(id != null) { // 로그인 된 상태
			chain.doFilter(request, response);
		}else { // 로그인이 안 된 상태
			// 로그인 폼으로 강제 redirect로 응답을 준다
			HttpServletResponse resp=(HttpServletResponse)response;
			String cPath=req.getContextPath();
			resp.sendRedirect(cPath+"/test/loginform.jsp");
			
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
