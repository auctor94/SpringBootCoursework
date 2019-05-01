
<#import "parts/login.ftl" as l>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <link rel="stylesheet/less" type="text/css" href="/static/login.less">
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js" ></script>
    <script src="/static/login.js"></script>
</head>
<body>
Login Page
<@l.login "/login" />
<a href="/registration">Add new user</a>
</body>
</html>







