<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ajax验证用户名是否可用</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	  
        function validate(){
                var username = document.getElementById("username").value;
		        //1.创建一个xmlhttprequest 对象
		        var request;
		        if(window.XMLHttpRequest){//如果是IE7以上和其他浏览器，采用这种方式获取,因为微软已经在IE7中把XMLHttpRequest实现为一个窗口对象属性
		           request = new XMLHttpRequest();
		        }
		        else if (window.ActiveXObject) {//IE5,6采用这种方式获取
		           request=new ActiveXObject("Microsoft.XMLHTTP");
		        }
		        
		        //2.调用xmlhttprequest open对象
		        var url = "Test?username="+username+new Date().getTime();
		        alert(request.readyState+"a");
		        //GET方法
		        request.open("GET",url,true);
		        //3.调用xmlhttprequest send对象
		        alert(request.readyState+"b");
		        request.send();
		          
		        //POST方法
		        //request.open("POST","Test",true);
		        //使用POST方法时，需要自己设置http的请求头
		        //request.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
		        //POST方法，在send方法中传值
		        //request.send("username="+username);
		          
		        alert(request.readyState+"c");
		        //4.对象xmlhttprequest添加onreadystatechange 响应函数
		        request.onreadystatechange=function(){
		           alert(request.readyState+"d");
		        	//5.判断响应是否完成  readystate 为4的时候
			        //6.判断响应是否可用 status 为200的时候
		            if(request.readyState == 4 && request.status == 200){
		           	    //7.打印响应结果 responsoseText
		           	     alert(request.readyState+"e");
				        document.getElementById("details").innerHTML = request.responseText;
		            }
		        };
        };
  </script>
  </head>
  
  <body>  
           <span>username：</span>
           <input type="text" name="username" id="username"/>
           <br/>
           <div id="details"></div>
           <input type="button" value="校验" onclick="validate()" /> 
  </body>
</html>
