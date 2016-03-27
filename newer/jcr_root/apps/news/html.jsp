
<%@page session="true"
	import="org.apache.sling.api.resource.*, javax.jcr.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sling:defineObjects />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Newer Times</title>
</head>

<body>

	<%@include file="/apps/news/header.jsp"%>
	<%@include file="/apps/news/topnav.jsp"%>
	<br />
	<br />
	<h2>Welcome to The Newer Times</h2>
	<div class="news_listing">
		<sling:listChildren var="children" resource="${resource}" />
		<c:forEach var="child" items="${children}">
			<c:set var="i" value="1" />
			<sling:listChildren var="grandsons" resource="${child}" />
			<c:forEach var="grandson" items="${grandsons}">
				<c:if test="${i  <= 2}">
					<sling:adaptTo adaptable="${grandson}"
						adaptTo="org.apache.sling.api.resource.ValueMap" var="myProps" />
					<div class="category1 well">
						<a href="${grandson.path}.html">
							<h2><c:out value="${sling:getValue(myProps,'title',String.class)}" />
							</h2>
						</a>
						<h3>
							<c:out value="${sling:getValue(myProps,'dateofpublish',String.class)}" />
						</h3>
						<p>
							<c:out value="${sling:getValue(myProps,'description',String.class)}" />
						</p>
						<span> 
							<a href="${sling:getValue(myProps,'link',String.class)}">Follow Up!</a>
						</span>

						<div class="news_footer">
							<div class="share">
								<!-- Share buttons -->

								<div class="fb-share-button" data-href="${grandson.path}.html"
									data-layout="button"></div>
								<a href="https://twitter.com/share" class="twitter-share-button"
									data-url="${grandson.path}.html">Tweet</a>
								<div class="g-plusone" href="${grandson.path}.html"
									data-size="tall" data-annotation="inline" data-width="300"></div>

							</div>
						</div>
					</div>
					<c:set var="i" value="${i+1}" />
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
</body>
</html>
<%@include file="/apps/news/footer.jsp"%>
