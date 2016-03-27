<%@page session="false"
	import="org.apache.sling.api.resource.*, javax.jcr.*"%>
	<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sling:defineObjects />
<%@include file="/apps/news/header.jsp"%>
<%@include file="/apps/news/topnav.jsp"%> 
<%
HttpSession session=request.getSession();
if(session!=null && session.getAttribute("user")!=null && session.getAttribute("user").equals("admin"))
{
%>

<form method="POST" action="<%=resource.getPath()%>/" enctype="multipart/form-data">
	Title: <input type="text" name="title"  class="form-control"/> <br />
	Description:
	<textarea name="description" class="form-control"></textarea>
	<br /> 
	Date of Publish: <input type="text" name="dateofpublish" class="form-control" /> 
	<br /> 
	Link: <input type="url"	name="link" class="form-control" /> 
	<input type="hidden" name=":redirect" value="<%=resource.getPath() %>.html" /> 
	<input type="hidden" name="sling:resourceType" value="news/show"/>
	<input type="hidden" name=":order" value="first"/>
	<input type="submit" value="Save Changes" class="form-control"/>
</form>

<%
}else{
	response.sendRedirect("/content/403.html");
}
%>