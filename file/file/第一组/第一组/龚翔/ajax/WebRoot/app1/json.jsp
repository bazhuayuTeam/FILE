<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>json</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">
    	var jsonObject = {name:"gongxiang",
                          age:12,
                          study:function(){
                                   alert(123);
                                }
                         };
                         
                         
        function getDate(){//iframe载入data.html后会执行此函数
           var iframe = document.getElementById("proxy");
           iframe.onload = function(){//这个时候a.html 与 iframe 已经是处于同一源了;
           	   var data =iframe.contentWindow.name;//获取iframe里的window.name，也就是data.html页面给他设置的数据
           	   alert(data);//获取到了data.html里的数据，
           };
           iframe.src = "b.html";//这里的b.html是随便的一个页面，只要与a.html同源就行了，目的是让a.html和iframe同域
        }
    </script>
  </head>
  <body>
    <iframe id="proxy" src="http://www.cnblogs.com/data.html" style="display:none" onload="getDate()"></iframe>
  </body>
</html>
