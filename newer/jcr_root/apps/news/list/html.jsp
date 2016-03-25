<%@page session="false"
	import="org.apache.sling.api.resource.*, javax.jcr.*,java.util.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sling:defineObjects />

<title>Newer Times|<%= resource.adaptTo(ValueMap.class).get("title") %></title>
<center>
	<h1><%= resource.adaptTo(ValueMap.class).get("title") %></h1>
</center>
<%
Iterator<Resource> resourceIterator = resource.listChildren();
HttpSession session=request.getSession();
if(session!=null && session.getAttribute("user")!=null && session.getAttribute("user").equals("admin"))
{	
	%><div class="news_listing">
	<%
while (resourceIterator.hasNext()) {
	 Resource childResource = resourceIterator.next();
	 ValueMap vMap = childResource.adaptTo(ValueMap.class); 
%>
	<a href="<%=childResource.getPath()%>.html">
		<div class="news">
			<div class="title">
				<span><h2><%=vMap.get("title",String.class) %></h2></span>
				<div class="dateofpublish">
					<span><%=vMap.get("dateofpublish",String.class) %></span>
					<div class="desciption">
						<span><%=vMap.get("description",String.class) %></span>
						<div class="link">
							<span> <a href="<%=vMap.get("link",String.class) %>">Follow
									Up!</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="news_footer">
				<div class="share">
					<!-- Share buttons -->

					<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
						<a class="a2a_dd" href="https://www.addtoany.com/share"></a> 
						<a class="a2a_button_facebook"></a> 
						<a class="a2a_button_twitter"></a>
						<a class="a2a_button_google_plus"></a> 
						<a class="a2a_button_pinterest"></a> 
						<a class="a2a_button_linkedin"></a>
						<a class="a2a_button_reddit"></a>
					</div>
					<script async src="https://static.addtoany.com/menu/page.js"></script>

				</div>
				<div class="edit">
					<a href="<%=childResource.getPath()%>.edit.html">EDIT</a>
				</div>
			</div>
		</div>
	</a>
	<%	
}
	%>
</div>
<%
}else{
%><div class="news_listing">
	<%
while (resourceIterator.hasNext()) {
	 Resource childResource = resourceIterator.next();
	 ValueMap vMap = childResource.adaptTo(ValueMap.class); 
%>
	<a href="<%=childResource.getPath()%>.html">
		<div class="news">
			<div class="title">
				<span><h2><%=vMap.get("title",String.class) %></h2></span>
				<div class="dateofpublish">
					<span><%=vMap.get("dateofpublish",String.class) %></span>
					<div class="desciption">
						<span><%=vMap.get("description",String.class) %></span>
						<div class="link">
							<span> <a href="<%=vMap.get("link",String.class) %>">Follow
									Up!</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="news_footer">
				<div class="share">
					<!-- Share buttons -->

					<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
						<a class="a2a_dd" href="https://www.addtoany.com/share"></a> 
						<a class="a2a_button_facebook"></a>
						<a class="a2a_button_twitter"></a>
						<a class="a2a_button_google_plus"></a> 
						<a	class="a2a_button_pinterest"></a> 
						<a class="a2a_button_linkedin"></a>
						<a class="a2a_button_reddit"></a>
					</div>
					<script async src="https://static.addtoany.com/menu/page.js"></script>

				</div>
			</div>
		</div>
	</a>
<%	
}
%>
</div>
<%
}%>