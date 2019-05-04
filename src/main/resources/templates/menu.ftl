<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <title>Welcome to Coffee and You | Menu page</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


    <link rel="stylesheet" href="/static/vendor.css">
    <link rel="stylesheet" href="/static/main.css">
    <script src="/static/modernizr.js"></script>

</head>
<body class="menu-page inner-page">
<!--[if lt IE 10]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<header>
    <div class="container">

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#coffeeNavbarPrimary" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>


                    <div class="collapse navbar-collapse" id="coffeeNavbarPrimary">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index">Домашняя страница</a></li>
                            <li class="active"><a href="menu">Билеты</a></li>
                            <li><a href="gallery">Заказ</a></li>
                            <li><a href="store.html">store</a></li>
                            <li><a href="contactus">Контакты</a></li>

                            <li><a href="shopcart.html">Cart </a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </nav>

    </div>

</header>


<section class="menu-sectn menu-list-page">


        <div class="container">
                            <div class="addticket"><a href="/tickets" style="font-size: smaller;">Добавить билет</a>\
                            <p style="font-size: x-small;">Доступно только администраторам</p></div>
                                <div class="section-heading-type2">
                                <h2>Мы предлагаем различные виды услуг своим посетителям.</h2>
                                <p>Чтобы забронировать билет, необходимо выброть его из слайдера снизу и нажать кнопку <b>Заказать</b></p>
                                </div>


						<#list tickets as ticket>
								<div class="pricing-table">
                                    <div class="pricing-carte clearfix scrollbar">
                                        <div class="cuisine-wrapper">
                                            <div class="cuisine ">
                                                <div class="clearfix">
                                                    <div class="card-left">
                                                        <div class="cuisine-name"><b>Тип билета: ${ticket.age}</b></div>
                                                        <div class="cuisine-detail"><b>Описание: ${ticket.nameTicket}</b></div>
                                                    </div>
                                                    <div class="card-right">
                                                        <div class="cuisine-price">
									                        <#if ticket.sale??>
                                                                <b>Стоимость билета: ${ticket.cost / 100 * ticket.sale} бел. руб.</b>
                                                            <#else>
									                         <b>Стоимость билета: ${ticket.cost} бел. руб.</b>
                                                          </#if>
                                                        </div>
                                                        <p> <b>Доступные зоны: ${ticket.zone}</b></p>

                                                    </div>

                                                </div>
                                            </div>



                                        </div>
                                        <div class="cuisine-heart" style="float: right;"><b>Время действия билета:
                                            ${ticket.time} ч.</b></div>

                                        <div class="menu-btn-holder clearfix" style="float: right; margin-top: 100px;">
                                            <form id="myform" action="/addorder" method="post">
                                                <label for="start">Введите дату и время</label>
                                                <input type="date" id="start" name="date" value="2018-07-22" min="2018-01-01" max="2019-12-31" style="width: 150px;">
                                                <input type="time" id="start" name="time" >
                                                <input type="submit" value="Заказать сейчас" id="login-button" />
                                                <input type="hidden" name="id" value="${ticket.ticketId}">
                                                <input type="hidden" name="login" value="${usernamet}">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                                 </form>
                                        </div>
                                    </div>
                                </div>

                        <#else> Ни одного билета нет в базе аквапарка. Извините за неудобства. P.S. Если вы
                            администратор, то создайте новый билет.
                        </#list>

        </div>
    </section>


<section class="contact-sectn">
    <div class="container">
        <div>
            <div class="section-heading">
                <h1><span>Контакты</span></h1>
                <h3><span>16</span> Вокзальная</h3>
                <p>Минская область, Минский район, аг. Ждановичи</p>
            </div>
        </div>
    </div>
</section>


<footer>
    <div class="upper">
        <div class="container">


            <div class="footer-nav-wrapper">
                <ul class="footer-nav clearfix">
                    <li><a href="index">Домашняя страница</a></li>
                    <li><a href="menu">Меню</a></li>
                    <li><a href="contactus">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="lower">
        <div class="container">
            <a href="#" class="back-to-top">↑↑↑</a>
            <small>&copy; 2019 Timothy fcuking coursework. Trademarks and brands are the property of their respective owners.</small>
        </div>
    </div>
</footer>


<script src="/static/vendor.js"></script>


<script src="/static/plugins.js"></script>

<script src="/static/main.js"></script>


</body>
</html>
