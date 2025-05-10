package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletResponse;

public class HttpCache implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
//		tomcat defualt encoding 설정에 의함
//		HttpServletRequest req=(HttpServletRequest)request;
//		req.setCharacterEncoding("UTF-8");
		
		if (response instanceof HttpServletResponse) {
			
			((HttpServletResponse) response).addHeader("Cache-Control", "no-cache");
			
		}
		
		chain.doFilter(request, response);
		
	}

}
