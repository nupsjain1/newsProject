<%@page session="false"
	import="org.apache.sling.api.resource.*, javax.jcr.*,java.util.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sling:defineObjects />
<head>
<title>Newer Times|<%= resource.adaptTo(ValueMap.class).get("title") %></title>

</script>
<style>
.category1 {
	float: left;
	margin: 10px;
	text-align: Center;
}
</style>
</head>
<body>
	<%@include file="/apps/news/header.jsp"%>
	<%@include file="/apps/news/topnav.jsp"%>
	<br />
	<br />
	<div class="jumbotron">
		<center>
			<h1><%= resource.adaptTo(ValueMap.class).get("title") %></h1>
		</center>
	</div>
	<%
Iterator<Resource> resourceIterator = resource.listChildren();
HttpSession sess=request.getSession();
if(sess!=null && sess.getAttribute("user")!=null && sess.getAttribute("user").equals("admin"))
{	
	%><div class="news_listing">
		<%
while (resourceIterator.hasNext()) {
	 Resource childResource = resourceIterator.next();
	 ValueMap vMap = childResource.adaptTo(ValueMap.class); 
%>
		<div class="category1 well">
			<a href="<%=childResource.getPath()%>.html"><h2><%=vMap.get("title",String.class) %></h2></a>
			<h3><%=vMap.get("dateofpublish",String.class) %></h3>
			<p><%=vMap.get("description",String.class) %></p>
			<span> <a href="<%=vMap.get("link",String.class) %>">Follow
					Up!</a>
			</span>
			<div class="news_footer">
				<div class="share">
					<!-- Share buttons -->

					<div class="fb-share-button"
						data-href="<%=childResource.getPath()%>.html" data-layout="button"></div>
					<a href="https://twitter.com/share" class="twitter-share-button"
						data-url="<%=childResource.getPath()%>.html">Tweet</a>
					<g:plusone data-href="<%=childResource.getPath()%>.html"
						expandTo="left" data-size="tall" data-annotation="bubble">
					google</g:plusone>
				</div>
				<div class="edit">
					<a href="<%=childResource.getPath()%>.edit.html"><img
						src="/content/images/edit.png"
						height="30px" width="30px" />EDIT</a>
				</div>
			</div>
		</div>

		<%	
}
	%>
	</div>
	<a href="<%=resource.getPath()%>.add.html">ADD CUSTOM NEWS</a>
	<%
}else{
%><div class="news_listing">
		<%
while (resourceIterator.hasNext()) {
	 Resource childResource = resourceIterator.next();
	 ValueMap vMap = childResource.adaptTo(ValueMap.class); 
%>
		<div class="category1 well">
			<a href="<%=childResource.getPath()%>.html"><h2><%=vMap.get("title",String.class) %></h2></a>
			<h3><%=vMap.get("dateofpublish",String.class) %></h3>
			<p><%=vMap.get("description",String.class) %></p>
			<span> <a href="<%=vMap.get("link",String.class) %>">Follow
					Up!</a>
			</span>

			<div class="news_footer">
				<div class="share">
					<!-- Share buttons -->

					<div class="fb-share-button"
						data-href="<%=childResource.getPath()%>.html" data-layout="button"></div>
					<a href="https://twitter.com/share" class="twitter-share-button"
						data-url="<%=childResource.getPath()%>.html">Tweet</a>
					<div class="g-plusone" href="<%=childResource.getPath()%>.html" data-size="tall" data-annotation="inline" data-width="300"></div>

				</div>
			</div>
		</div>
		<%	
}
%>
	</div>
	<%

}%>
	
</body>
<%@include file="/apps/news/footer.jsp"%>