<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout />
    <span><a href="/user">List of users</a> </span>
</div>
    <div>
        <form method="post">
            <input type="text" name="login" placeholder="Input login">
            <input type="text" name="password" placeholder="Input password">
            <select id="mySelectId" name="status">
                <option value="admin">Администратор</option>
                <option value="user" selected>Пользователь</option>
            </select>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Отправить в БД</button>
        </form>excluded
    </div>
    <div>
        <form method="get" action="/main">
            <input type="text" name="filter" value="${filter}">
            <button type="submit">Найти</button>

        </form>
    </div>
    <div>Список пользователей</div>
    <#list users as user>
    <div>
        <b>${user.idUser}</b>
        <b>${user.name}</b>
        <b>${user.password}</b>
        <b>${user.status}</b>
    </div>
    <#else> No users
</#list>
</@c.page>