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
    <link rel="stylesheet" href="/static/orders.css">
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
                            <li><a href="/index">Домашняя страница</a></li>
                            <li class="active"><a href="/menu">Билеты</a></li>
                            <li><a href="/gallery">Заказ</a></li>
                            <li><a href="/contactus">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

    </div>

</header>


<section class="menu-sectn menu-list-page">
    <div class="container">
        <div class="section-heading-type2">
             <#if order??>
                 <form action="/ordersedit" id="reservation-form" method="post"  class="clearfix" data-parsley-validate>
                 <div class="form-group edit"> <label for="start">Введите новую дату</label> <input type="date" id="start" name="date" value="${order.date}" min="2018-01-01" max="2019-12-31" style="width: 150px;">
 <label for="start1">Введите новое время</label> <input type="time" id="start1" name="time" value="${order.time}">  <input type="hidden" value="${order.orderId}" name="orderID" >
                     <input type="hidden" value="${_csrf.token}" name="_csrf" >
                     <button class="updatebut" type="submit">Изменить</button></div>


                 </form>
                 <form action="/ordersdelete" id="reservation-form" method="post"  class="clearfix" data-parsley-validate>
                     <div class="form-group"> <input type="hidden" value="${order.orderId}" name="orderID" ></div>
                     <input type="hidden" value="${_csrf.token}" name="_csrf" >
                     <div class="form-group edit">  <button class="updatebut" type="submit">Удалить заказ</button></div>
                 </form>
             <#else>
									                         <b>У вас нет заказов! <a href="menu">Заказать билет сейчас </a></b>
             </#if>
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
                    <li><a href="gallery">заказ</a></li
                    <li><a href="contactus">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="lower">
        <div class="container">
            <a href="#" class="back-to-top">↑↑↑</a>
            <small></small>
        </div>
    </div>
</footer>


<script src="/static/vendor.js"></script>


<script src="/static/plugins.js"></script>
<script src="/static/validation.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script src="/static/main.js"></script>


</body>
</html>

