<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.navi_bar_area {
	overflow: hidden;
	height: 100px;
}

.navi_bar_area a {
	float: left;
	text-align: center;
	text-decoration: none;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown-content {
	display:none;
	position: absolute;
	z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  text-decoration: none;
  display: inline-block;
  text-align: left;
}
.dropdown:hover .dropdown-content {
	display: block;
}
.navi_bar_area a:hover, .dropdown:hover .dropbtn {
	background-color: #475382;
}

.dropdown-content a:hover {
	background-color: #ddd;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navi_bar_area">
		<div class="dropdown">
		    <button id="dropbtn" onclick="location.href='search?type=C&c_Code=1';">상의</button>
		    <div class="dropdown-content"> 
			    <c:forEach items="${Inner}" var="category"> 
		    		<a href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
		    	</c:forEach>	      		      
		    </div>			
		</div>
		<div class="dropdown">
		    <button id="dropbtn" onclick="location.href='search?type=C&c_Code=2';">하의</button>
		    <div class="dropdown-content">  
		    	<c:forEach items="${Pants}" var="category"> 
		    		<a href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
		    	</c:forEach>    		      		      
		    </div>			
		</div>
		<div class="dropdown">
		    <button id="dropbtn" onclick="location.href='search?type=C&c_Code=3';">아우터</button>
		    <div class="dropdown-content">
		    	<c:forEach items="${Outer}" var="category"> 
		    		<a href="search?type=C&c_Code=${category.c_Code}">${category.c_Name}</a>
		    	</c:forEach>
		    </div>			
		</div>
		<button onclick="location.href='search';">전체</button>
	</div>
</body>
</html>