<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <title>Билеты</title>
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
                            <li><a href="/menu">Билеты</a></li>
                            <li><a href="/orders">Заказы</a></li>
                            <li><a href="/gallery">Оставить отзыв</a></li>
                            <li><a href="/contactus">Контакты</a></li>
                            <li><a href="/logout">Выйти из аккаунта</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <section class="table-book">

            <div>
                <div class="section-number"><span>01</span></div>
                <div class="section-heading">
                    <h1><span>Добро пожаловать в меня создания нового билета, ${usernamet}</span></h1>
                </div>
            </div>

            <div class="reservation-form clearfix">
                <form action="/addticket" id="reservation-form" method="post" class="clearfix" data-parsley-validate>
                    <h3>Онлайн <span>Форма Создания</span></h3>
                    <div class="form-group">
                        <input type="text" class="form-control"  placeholder="Цена" name="cost" required>
                    </div>
                    <div class="form-group">
                        <p>Введите процент скидки (если необходимо):</p>
                        <p><input type="number" class="form-control" size="3" name="sale" min="0" max="100" ></p>
                    </div>

                    <div class="form-group">
                        <select name="zone" class="form-control">
                            <option name="zone">Акваторий, SPA, Бани и сауны</option>
                            <option name="zone">Акваторий, SPA</option>
                            <option name="zone">Акваторий, Бани и сауны</option>
                            <option name="zone">SPA, Бани и сауны</option>
                            <option name="zone">Бани и сауны</option>
                            <option name="zone">SPA</option>
                            <option name="zone">Акваторий</option>
                        </select>
                    </div>

                    <div class="form-group">
                    <select name="age" class="form-control">
                        <option name="age">Взрослый</option>
                        <option name="age">Детский</option>
                    </select>
                    </div>

                    <div class="form-group">
                        <p>Введите количество часов:</p>
                        <p><input type="number" class="form-control" size="3" name="time" min="1" max="5" value="1"></p>
                    </div>
                     <textarea placeholder="Описание билета" class="textarea" name="name" required></textarea>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div><input type="submit" value="Добавить билет" onclick="return validate_form(this.form)" id="login-button" /></div>
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
                    <li><a href="/index">Домашняя страница</a></li>
                    <li><a href=/menu">Билеты</a></li>
                    <li><a href="/gallery">Оставить отзыв</a></li>
                    <li><a href="/orders">Заказы</a></li>
                    <li><a href="/contactus">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="lower">
        <div class="container">
            <a href="#" class="back-to-top">↑↑↑</a>
            <small>&copy; 2015 0efforttheme. Trademarks and brands are the property of their respective owners.</small>
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
