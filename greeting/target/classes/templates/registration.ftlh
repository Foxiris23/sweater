<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-1">Add new User</div>
    ${message!""}
    <@l.login "/registration" true />
    <a href="/login">Войти</a>
</@c.page>