<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试ajax之html格式</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
        //1.获取a节点，并为其添加onclick  响应函数
        window.onload = function(){
	        document.getElementsByTagName("a")[0].onclick = function(){
		        //2.创建一个xmlhttprequest 对象
		        var request;
		        if(window.XMLHttpRequest){//如果是IE7以上和其他浏览器，采用这种方式获取,因为微软已经在IE7中把XMLHttpRequest实现为一个窗口对象属性
		           request = new XMLHttpRequest();
		        }
		        else if (window.ActiveXObject) {//IE5,6采用这种方式获取
		           request=new ActiveXObject("Microsoft.XMLHTTP");
		        }
		        //3.发送 url
		        var url = this.href;
		        var method = "GET";
		        //5.调用xmlhttprequest open对象
		        request.open(method,url,true);
		        //6.调用xmlhttprequest send对象
		        request.send();
		        //7.对象xmlhttprequest添加onreadystatechange 响应函数
		        request.onreadystatechange = function(){
				     //8.判断响应是否完成  readystate 为4的时候
				     //9.判断响应是否可用 status 为200的时候
		             if(request.readyState == 4 && request.status == 200){
		             	//10.打印响应结果 responsoseText
				        document.getElementById("details").innerHTML = request.responseText;
		             }
		        };
		        return false;
	        };
        };
        
        
  </script>
  </head>
  
  <body>
       <a href="files/ajax">helloAjax</a>
       <div id="details"></div>
  </body>
</html>
