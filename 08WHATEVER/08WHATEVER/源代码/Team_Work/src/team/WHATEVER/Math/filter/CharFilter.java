package team.WHATEVER.Math.filter;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.sun.net.httpserver.Filter.Chain;

public class CharFilter implements Filter {

	String encoding =null;
	

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	//	request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding(encoding);
		chain.doFilter(request,response);
	}


	public void init(FilterConfig filterConfig) throws ServletException {
		encoding=filterConfig.getInitParameter("encoding");
		
	}
    public void destroy() {
		
		
	}
	

}
