$(document).ready(function() {
	navigator.geolocation.getCurrentPosition(function(position) {
		 
		 $.ajax({
			    url:"http://api.openweathermap.org/data/2.5/weather?lat="+position.coords.latitude+"&lon="+position.coords.longitude+"&units=metric&appid=26e6296659feb17ae6a48bb25aa6fe05",
			    datatype:"json",
			    success:function(data)
			    {
			    	$(".weather").html("<h3>weather forcast</h3><br>"+"Place:"+data.name+"<br>Max Temp:"+data.main.temp_max+"<br>Min Temp:"+data.main.temp_min);
			    },
			    error:function()
			    {
			    	console.log("error");
			    }
			    	
			    });
		});
					$.fn.hoverIntent = function(handlerIn, handlerOut, selector) {
						var cfg = {
							interval : 100,
							sensitivity : 6,
							timeout : 0
						};
						if (typeof handlerIn === "object") {
							cfg = $.extend(cfg, handlerIn)
						} else {
							if ($.isFunction(handlerOut)) {
								cfg = $.extend(cfg, {
									over : handlerIn,
									out : handlerOut,
									selector : selector
								})
							} else {
								cfg = $.extend(cfg, {
									over : handlerIn,
									out : handlerIn,
									selector : handlerOut
								})
							}
						}
						var cX, cY, pX, pY;
						var track = function(ev) {
							cX = ev.pageX;
							cY = ev.pageY
						};
						var compare = function(ev, ob) {
							ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
							if (Math.sqrt((pX - cX) * (pX - cX) + (pY - cY)
									* (pY - cY)) < cfg.sensitivity) {
								$(ob).off("mousemove.hoverIntent", track);
								ob.hoverIntent_s = true;
								return cfg.over.apply(ob, [ ev ])
							} else {
								pX = cX;
								pY = cY;
								ob.hoverIntent_t = setTimeout(function() {
									compare(ev, ob)
								}, cfg.interval)
							}
						};
						var delay = function(ev, ob) {
							ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
							ob.hoverIntent_s = false;
							return cfg.out.apply(ob, [ ev ])
						};
						var handleHover = function(e) {
							var ev = $.extend({}, e);
							var ob = this;
							if (ob.hoverIntent_t) {
								ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t)
							}
							if (e.type === "mouseenter") {
								pX = ev.pageX;
								pY = ev.pageY;
								$(ob).on("mousemove.hoverIntent", track);
								if (!ob.hoverIntent_s) {
									ob.hoverIntent_t = setTimeout(function() {
										compare(ev, ob)
									}, cfg.interval)
								}
							} else {
								$(ob).off("mousemove.hoverIntent", track);
								if (ob.hoverIntent_s) {
									ob.hoverIntent_t = setTimeout(function() {
										delay(ev, ob)
									}, cfg.timeout)
								}
							}
						};
						return this.on({
							"mouseenter.hoverIntent" : handleHover,
							"mouseleave.hoverIntent" : handleHover
						}, cfg.selector)
					};

					var config3 = {
						over : showFacultyLogin, // function = onMouseOver callback (REQUIRED)    
						timeout : 100, // number = milliseconds delay before onMouseOut    
						out : hideFacultyLogin
					// function = onMouseOut callback (REQUIRED)    
					};

					$("#top_login_inner").hoverIntent(config3);
					function showFacultyLogin() {
						$("#top_login_form_trigger").addClass("active");
						$("#top_login_form").addClass("shown");
					}
					function hideFacultyLogin() {
						$("#top_login_form_trigger").removeClass("active");
						$("#top_login_form").removeClass("shown");
					}
					
					
					//twitter
					window.twttr = (function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0], t = window.twttr || {};
						if (d.getElementById(id))
							return t;
						js = d.createElement(s);
						js.id = id;
						js.src = "https://platform.twitter.com/widgets.js";
						fjs.parentNode.insertBefore(js, fjs);

						t._e = [];
						t.ready = function(f) {
							t._e.push(f);
						};

						return t;
					}(document, "script", "twitter-wjs"));
					
					//facebook
					(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id))
							return;
						js = d.createElement(s);
						js.id = id;
						js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
					
					
					
					
					
					
				});