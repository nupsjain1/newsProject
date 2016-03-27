<%@page session="false"
	import="org.apache.sling.api.resource.*, javax.jcr.*,java.util.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sling:defineObjects />
<head>
<title>Newer Times|<%= resource.adaptTo(ValueMap.class).get("title") %></title>
</head>
<body>
<%@include file="/apps/news/header.jsp"%>
<%@include file="/apps/news/topnav.jsp"%>

<center>
	<h1><%= resource.adaptTo(ValueMap.class).get("title") %></h1>
</center>


	<%
HttpSession session=request.getSession();
ValueMap vMap = resource.adaptTo(ValueMap.class); 
%>
<div class="news">
	<div class="title">
		<span><%=vMap.get("title",String.class) %></span>
		<div class="dateofpublish">
			<span><%=vMap.get("dateofpublish",String.class) %></span>
			<div class="desciption">
				<span><%=vMap.get("description",String.class) %></span>
			</div>
		</div>
	</div>
	<div class="news_footer">
		<div class="share">
			<!-- Share buttons -->

			<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
				<a class="a2a_dd" href="https://www.addtoany.com/share"></a> <a
					class="a2a_button_facebook"></a> <a class="a2a_button_twitter"></a>
				<a class="a2a_button_google_plus"></a> <a
					class="a2a_button_pinterest"></a> <a class="a2a_button_linkedin"></a>
				<a class="a2a_button_reddit"></a>
			</div>
<%if(session!=null && session.getAttribute("user")!=null && session.getAttribute("user").equals("admin"))
{ %>
		</div>
		<div class="edit">
			<a href="<%=resource.getPath()%>.edit.html"><img src="/content/images/edit.png" height="30px" width="30px"/>EDIT</a>
		</div>
<%	
}
%>
	</div>
</div>

</body>
<%@include file="/apps/news/footer.jsp"%> 