package com.hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/*
 	- GenericServlet
 	 : 추상클래스
 	 : Servlet 인터페이스 구현 클래스
 	 : 서블릿의 기반이 되는 클래스
 	 : service() 메서드는 추상 메서드로 반드시 재정의 해야 한다.
 */


public class HelloServlet extends GenericServlet {
	private static final long serialVersionUID = 1L;
	
	private long count;
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			
			// 서블릿이 초기화 될때 한번 실행
			System.out.println("init ...");
		}

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// 클라이언트가 요청할때 마다 실행
		
		// req : 클라이언트 요청 정보를 거지고 있는 객체
		// resp : 클라이언트 요청내용을 처리 후 웅덥 정보를 가지고 있는 객체
		try {
			count++;
			
			// System.out.println("service : " + count);
			
			Calendar cal = Calendar.getInstance();
			String s = String.format("%tF %tT", cal, cal);
			
			// 클라이언트에게 보내는 문서의 type
			resp.setContentType("text/html; charset=utf-8");
			
			// 클라이언트에게 HTML 문서 전송
			PrintWriter out = resp.getWriter();
			
			out.println("<html>");
			out.println("<head><title>첫번째 예제</title></head>");
			out.println("<body>");
			out.println("<h3>서블릿 첫번째 예제</h3>");
			out.println("<p>접속날짜 및 시간 : " + s + "</p>");
			out.println("<p>COUNT : " + count + "</p>");
			out.println("</body>");
			out.println("</html>");
			
		} catch (Exception e) {
			getServletContext().log("error : ", e);
		}
	}
	
	@Override
	public void destroy() {
		// 서블릿이 파괴될때 한번 실행(WAS 가 종료되는 시점)
		System.out.println("destory ...");
	}
	
}
