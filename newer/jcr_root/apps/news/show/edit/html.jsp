<%@page session="false" import="org.apache.sling.api.resource.*, javax.jcr.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<sling:defineObjects/>

<%
ValueMap res = resource.adaptTo(ValueMap.class);
String title=res.get("title").toString();
String description=res.get("description").toString();
String dateofpublish=res.get("dateofpublish").toString();
String link=res.get("link").toString();
%>
<form method="POST" action=<%=resource.getPath()%> enctype="multipart/form-data">
	Title:
	<input type="text" name="title" value="<%=title %>" />
	<br/>
	Description:
	<textarea name="description" ><%=description %></textarea>
	<br/> 
	Date of Publish:
	<input type="text" name="dateofpublish" value=<%=dateofpublish%> />
	<br/>
	Link:
	<input type="url" name="link" value=<%=link %> />
	<input type="hidden" name=":redirect" value="/content/newernews/entertainment.html"/>
	<input type="submit" value="Save Changes"/>
</form>