<#import "parts/registration.ftl" as l>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <link rel="stylesheet" href="/static/login.css">
</head>
<body>
${message}
<@l.login "/registration" />
</body>
</html>
