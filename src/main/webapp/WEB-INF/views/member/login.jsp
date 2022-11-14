<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/login.css">
	<title>Login Page</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js" 
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" 
	crossorigin="anonymous"></script>
</head>
<body class="text-center">
	<main class="form-signin">
		<form  action="<%=request.getContextPath()%>/login-process" id="loginform" name="loginform" method="post" >
		  <!--  <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
		    <h1 class="h3 mb-3 fw-normal">Please login</h1>
		    
		    <div class="form-floating">
		      <input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
		      <label for="floatingInput">ID</label>
		    </div>
		    
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">Password</label>
		    </div>
		
			<!-- 	    
			<div class="checkbox mb-3">
		      <label>
		        <input type="checkbox" value="remember-me"> Remember me
		      </label>
		    </div> 
		    -->
		    <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
		</form>
		<a href="<%=request.getContextPath()%>/">홈</a>
		<a href="<%=request.getContextPath()%>/member/findPage">아이디 비밀번호 찾기</a>
	</main>
	<script sc="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>