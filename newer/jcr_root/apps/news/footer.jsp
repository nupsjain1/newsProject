<style>
#footer_inner{ 
width: 100%;
 top:70%;
 margin: 0 auto; 
position: relative;
 background:black; 
}
h3 {
    color: white;
    margin-left: 40px;
} 

#copyrights{

text-align: center;
vertical-align:middle;
line-height: 90px;  
}

.social {
  position: relative;
  width: 100%;
  top: 100%;
  text-align: center;
  transform: translateY(-50%);
}

.social .link {
  display: inline-block;
  vertical-align: middle;
  position: relative;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  border: 2px dashed white;
  background-clip: content-box;
  padding: 10px;
  transition: .5s;
  color: #D7D0BE;
  margin-left: 15px;
  margin-right: 15px;
  text-shadow:
    0 -1px 0 rgba(0, 0, 0, 0.2),
    0 1px 0 rgba(255, 255, 255, 0.2);
  font-size: 70px;
}

.social .link span {
  display: block;
  position: relative;
  text-align: center;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.social .link:hover {
  padding: 20px;
  color: white;
  margin-left: -5px;
  transform: translateX(10px) rotate(360deg);
}

.social .link.google-plus {
  background-color: #dd4b39;
  color: white;
}

.social .link.twitter {
  background-color: #00ACEE;
  color: white;
}

.social .link.facebook {
  background-color: #3B5998;
  color: white;
}


#footer_outer{
 position:relative;
 top:50%;
 left:0;
 width:100%;
 height:10%;
 } 


 </style> 
<div id="footer_outer">
 <div id="footer_inner">
<div class="socialLinks">
<div class="container">
  <div class="social">
  <a href="http://facebook.com" class="link facebook" target="_parent"> <img src="/content/images/facebook.png" alt="Facebook" width="40" height="40" style="display: block ,
    margin-left: auto ,
    margin-right: auto"></a>
  <a href="https://twitter.com" class="link twitter" target="_parent"><img src="/content/images/twitter.jpeg" alt="Twitter" width="40" height="40" align="middle"></a>
  <a href="https://plus.google.com" class="link google-plus" target="_parent"><img src="/content/images/gplus.png" alt="Google-Plus" width="40" height="40" align="middle"></a>
</div>
</div>
	<div id="copyrights">
	<h3>&copy; Copyright 2016 newernews.com </h3>
	</div>
 </div>
 </div>
</body>
</html>