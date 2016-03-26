<!--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
-->
<!-- simple JSP rendering test -->
<%@page session="true" import="org.apache.sling.api.resource.*, javax.jcr.*"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<sling:defineObjects/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
<link rel="stylesheet" href="/content/css/bootstrap.min.css">
  <script src="/content/js/jquery.min.js"></script>
  <script src="/content/js/bootstrap.min.js"></script>
</head>

<body>
<h1><%= resource.adaptTo(ValueMap.class).get("jcr:title") %></h1>
<p><%= resource.adaptTo(ValueMap.class).get("jcr:description") %></p>

<%	session.setAttribute("user","admin");
%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Newer News</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="/content/newernews/entertainment.html" >Entertainment</a></li>
      <li><a href="/content/newernews/sports.html" >Sports</a></li>
      <li><a href="/content/newernews/ttnd.html" >TTN-Digital</a></li>
      
      <li><a href="/content/newernews/health.html" >Health</a></li>
      <li><a href="/content/newernews/lifestyle.html" >Lifestyle</a></li>
      <li><a href="/content/newernews/education.html" >Education</a></li>
    </ul>
  </div>
</nav>

<h2>Welcome to Newer News</h2>



</body>
</html>