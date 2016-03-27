<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav style="top:10%" class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/content/newernews.html">Newer News</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/content/newernews.html">Home</a></li>
      <li><a href="/content/newernews/entertainment.html" >Entertainment</a></li>
      <li><a href="/content/newernews/sports.html" >Sports</a></li>
      <li><a href="/content/newernews/ttnd.html" >TTN-Digital</a></li>
      <li><a href="/content/newernews/health.html" >Health</a></li>
      <li><a href="/content/newernews/lifestyle.html" >Lifestyle</a></li>
      <li><a href="/content/newernews/education.html" >Education</a></li>
    </ul>
  </div>
  <div id="top_login_outer" style="float: right">
					<div id="top_login_inner" class="floatright">
					<%
					if(request.getParameter("out")!=null ){
						if(request.getParameter("out").equals("t")){
							request.getSession().setAttribute("user","user");
							response.sendRedirect(resource.getPath()+".html");
						}
					}
					if(request.getParameter("username")!=null && request.getParameter("password")!=null && request.getParameter("username").equals("admin") && request.getParameter("password").equals("admin")){
						request.getSession().setAttribute("user","admin");
						response.sendRedirect(resource.getPath()+".html");
					}
					if(request.getSession().getAttribute("user")!=null){
					if(!request.getSession().getAttribute("user").equals("admin")){
					%>
						<div id="top_login_form_trigger">
							<span>Admin Login</span>
						</div>
						<div id="top_login_form">
							<form action="<%=resource.getPath() %>.html" method="get">
								<label>Username</label>
								<input class="text" type="text"	id="username" name="username" /> 
								<label>Password</label>
								<input class="text" type="password" id="password" name="password" /> 
								<input type="submit" style="background:#00ced1;" name="login" class="submitbtn floatright" Value="login" />
							</form>
						</div>
						<%
						}else{
							%>
							<div id="top_login_form_trigger">
								<span><a href="<%=resource.getPath() %>.html?out=t">logout</a></span>
							</div>
							<% 
						}
					}else{
						request.getSession().setAttribute("user","user");
						response.sendRedirect(resource.getPath()+".html");
					}				
						
					%>
						
					</div>
			</div>
</nav>
