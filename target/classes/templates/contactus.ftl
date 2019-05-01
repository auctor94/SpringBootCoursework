<!doctype html>
<html class="no-js" lang="">
	<head>
		<meta charset="utf-8">
		<title>Welcome to Coffee and You | Contact us page</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="shortcut icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="apple-touch-icon.png">
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


		<link rel="stylesheet" href="/static/vendor.css">
		<link rel="stylesheet" href="/static/main.css">
		<script src="/static/modernizr.js"></script>
		
	</head>
	<body class="menu-page inner-page">
		<!--[if lt IE 10]>
			<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
		<![endif]-->

		<header>
			<div class="container">
				 
				<nav class="navbar navbar-default">
				  <div class="container-fluid">
					  <div class="row">
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#coffeeNavbarPrimary" aria-expanded="false">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <div class="collapse navbar-collapse" id="coffeeNavbarPrimary">
					      <ul class="nav navbar-nav navbar-right">
					        <li><a href="index">Домашняя страница</a></li>
					        <li><a href="menu">Меню</a></li>
					        <li><a href="blog-list.html">blog</a></li>
                              <li><a href="gallery">Заказ</a></li>
					        <li><a href="store.html">store</a></li>
					        <li class="active"><a href="contactus">Контакты</a></li>

					        <li><a href="shopcart.html">Cart </a></li>

					      </ul>
					    </div>
					  </div>
				  </div>
				</nav>
				<div class="banner clearfix">
					<div class="banner-img">
						<img src="images/cup.png" alt="image">
					</div>

				</div>
			</div>

		</header>

		<div class="contactpage">
			<div class="container">
				<h2>contact page headng here</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				<div class="cont-wrap">
					<div class="addressbar row">
						<div class="marker clearfix">
							<a href="#">
								<i class="fa fa-map-marker"></i>
							</a>
							<div class="cont">
								<h4>102 / Cappuccino city</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
						</div>
						<div class="support-mail clearfix">
							<a href="#">
								<i class="fa fa-envelope"></i>
							</a>
							<div class="cont">
								<h4>support@cofeeshop.com</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>
					<div class="mapwrapper row">
						<div id="map-canvas">
							
						</div>
					</div>
				</div>	
				<div class="leave-comment">
					<h4 class="headingcontact">contact us</h4>
					<form id="contactform" data-parsley-validate>
						<div class="form-group">
						   <input type="text" class="form-control"  placeholder="Name" name="name" required>
						 </div>
						 <div class="form-group">
						   <input type="email" class="form-control" placeholder="Email Id" name="email" required>
						 </div>
						 <div class="form-group">
						    <input type="text" class="form-control"  placeholder="Subject" name="usersubject" required>
						  </div>
						  <textarea placeholder="Message" class="textarea" name="message" required></textarea>
						 <button type="submit" class="">post comment</button>
						 <div class="hidden ajaxmessage for-contactform">
						 	
						 </div>
					</form>
				</div>
			</div>
		</div>

		<footer>
			<div class="upper">
				<div class="container">
					<h2>Let's visit our</h2>
					<h3>Shop Today</h3>

					<div>
						<img src="images/logo.png" alt="">	
					</div>
					

					<a href="store.html" class="order-btn">Order your coffee now !</a>

					<div class="footer-nav-wrapper">
						<ul class="footer-nav clearfix">
							<li><a href="index">Home</a></li>
							<li><a href="menu">Menu</a></li>
							<li><a href="gallery">Gallery</a></li>
							<li><a href="shopcart">Cart</a></li>
							<li><a href="contactus">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="lower">
				<div class="container">
					<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
					<small>&copy; 2015 0efforttheme. Trademarks and brands are the property of their respective owners.</small>
				</div>
			</div>
		</footer>


		<script src="scripts/vendor.js"></script>

		
		<script src="scripts/plugins.js"></script>
		

		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
		<script src="scripts/main.js"></script>

		
		
	</body>
</html>
