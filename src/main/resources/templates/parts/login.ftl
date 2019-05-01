<#macro login path>
<div class="wrapper">
<div class="container">
    <h1>Welcome</h1>
    <form action="${path}" method="post" class="form">
        <div><label> User Name : <input type="text" name="username" placeholder="Username"/> </label></div>
        <div><label> Password: <input type="password" name="password" placeholder="Password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div><input type="submit" value="Sign In" id="login-button"/></div>
    </form>
</div></div>
</#macro>

<#macro logout>
<div class="wrapper">
<div class="container">
    <form action="/logout" method="post" class="form">
        <input type="submit" value="Sign Out" id="login-button"/>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</div></div>
</#macro>