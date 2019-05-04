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
        <div class="section-heading-type2">
            <h2>Ваши заказы, ${usernamet}</h2>
            <p>for delete push the button</p>
        </div>
    </div>

    <#if table??>
               <table id="racetimes">
                   <tr id="firstrow"><th>Id заказа</th><th>Тип билета</th><th>Время действия</th><th>Стоимость</th><th>Дата</th></tr>
                     <#list table as order>
                        <tr><td>${order.id}</td><td>${order.type}</td><td>${order.times}</td><td>${order.cost}</td><td>${order.date}</td></tr>
                     </#list>

               </table>
    <#else>
									                         <b>У вас нет заказов! <a href="menu">Заказать билет сейчас </a></b>
    </#if>


</section>


<footer>
    <div class="upper">
        <div class="container">


            <div class="footer-nav-wrapper">
                <ul class="footer-nav clearfix">
                    <li><a href="index">Домашняя страница</a></li>
                    <li><a href="menu">Меню</a></li>
                    <li><a href="gallery">заказ</a></li
                    <li><a href="contactus.html">Contact</a></li>
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


<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script src="/static/main.js"></script>


</body>
</html>

