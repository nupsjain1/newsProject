<%@page session="false"
	import="org.apache.sling.api.resource.*, javax.jcr.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<sling:defineObjects />
<head>
</head>
<body>
<%@include file="/apps/news/header.jsp"%>
<%@include file="/apps/news/topnav.jsp"%> 
<%
HttpSession session=request.getSession();
if(session!=null && session.getAttribute("user")!=null && session.getAttribute("user").equals("admin"))
{
	ValueMap res = resource.adaptTo(ValueMap.class);
	String title=res.get("title").toString();
	String description=res.get("description").toString();
	String dateofpublish=res.get("dateofpublish").toString();
%>
<form method="POST" action=<%=resource.getPath()%>
	enctype="multipart/form-data">
	Title: <input type="text" name="title" value="<%=title %>" class="form-control"/> <br />
	Description:
	<textarea name="description" class="form-control"><%=description %></textarea>
	<br /> 
	Date of Publish: <input type="text" name="dateofpublish" value=<%=dateofpublish%> class="form-control" /> 
	<br /> 
	<input type="hidden" name=":redirect" value="<%=resource.getPath() %>.html" /> 
	<input type="submit" value="Save Changes" class="form-control"/>
</form>

<%
}else{
	response.sendRedirect("/403.html");
}
%>
</body>
<%@include file="/apps/news/footer.jsp"%> 