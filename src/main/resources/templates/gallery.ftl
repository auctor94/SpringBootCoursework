<!doctype html>
<html class="no-js" lang="">
	<head>
		<meta charset="utf-8">
		<title>Welcome to Coffee and You | Gallery page</title>
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
					        <li><a href="/index">Домашняя страница</a></li>
					        <li><a href="menu">Билеты</a></li>
					        <li class="active"><a>Заказ</a>
					        </li>
					        <#--<li><a href="store.html">store</a></li>-->
					        <#--<li><a href="contactus">Контакты</a></li>-->

					        <#--<li><a href="shopcart.html">Cart </a></li>-->
					      </ul>
					    </div>
					  </div>
				  </div>
				</nav>

                 <section class="table-book">

                <div>
                    <div class="section-number"><span>01</span></div>
                    <div class="section-heading">
						<h1><span>${usernamet}</span></h1>
                        <h1><span>Забронируй свою</span></h1>
                        <h2>услугу</h2>
                    </div>
                </div>

                <div class="reservation-form clearfix">
                    <form action="/order" id="reservation-form" method="post"  class="clearfix" data-parsley-validate>
                        <h3>Онлайн <span>Форма Бронирования</span></h3>
                      <div class="form-group">
                        <label for="contactMessage">Leave a message</label>
                        <div>
                            <textarea name="comment" class="form-control" id="contactMessage" placeholder="Напишите свой отзыв" required></textarea>
                            <input type="hidden" name="login" value="${usernamet}" />
                        </div>
                      </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <div><input type="submit" value="Order Now" id="login-button" /></div>
                    </form>
                </div>
        </section>
			</div>

		</header>
		



        <section class="contact-sectn">
            <div class="container">
                <div>
                    <div class="section-number"><span>09</span></div>
                    <div class="section-heading">
                        <h1><span>Контакты</span></h1>
                    </div>
                </div>
            </div>
            <div class="contact-us">
                <div class="add">
                    <div class="add-inner-wrapper">


                        <h3><span>16</span> Вокзальная</h3>
                        <p>Минская область, Минский район, аг. Ждановичи</p>
                    </div>
                </div>


                <div id="map-canvas" ></div>
            </div>
        </section>


		<footer>
			<div class="upper">
				<div class="container">
					<div class="footer-nav-wrapper">
						<ul class="footer-nav clearfix">
							<li><a href="index.html">Home</a></li>
							<li><a href="menu.html">Menu</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="shopcart.html">Cart</a></li>
							<li><a href="contactus.html">Contact</a></li>
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


		<script src="/static/vendor.js"></script>

		
		<script src="/static/plugins.js"></script>
		

		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
		<script src="/static/main.js"></script>

		
		
	</body>
</html>
