package testServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> usernames = Arrays.asList("aaa","bbb","ccc");
		
        String username = request.getParameter("username");
        System.out.print(username);
		String result = null;
		if(usernames.contains(username)){
			result = "<font color='red'>该用户名已被使用</font>";
		}
		else{
			result = "<font color='green'>该用户名可以使用</font>";
		}
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter  out = response.getWriter();
		out.print(result);
		out.flush();
	    out.close();
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
		
		List<String> usernames = Arrays.asList("aaa","bbb","ccc");
		response.setContentType("text/html");//设置发送到客户端的响应的内容类型为html
	    response.setCharacterEncoding("utf-8");//设置字符串格式
	    PrintWriter out=response.getWriter();//返回响应给客户端,response限制在当前http请求中，与Request相呼应
	    //获取页面参数
		String username = request.getParameter("username");
		String result = null;
		if(usernames.contains(username)){
			result = "<font color='red'>该用户名已被使用</font>";
		}
		else{
			result = "<font color='green'>该用户名可以使用</font>";
		}
		out.print(result);
        out.flush();
        out.close();
	}
}
