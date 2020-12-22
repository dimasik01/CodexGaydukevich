<#import "parts/page.ftlh" as p>
<#import "parts/login.ftlh" as l>

<@p.page>
<div class="center1">
<h1> Вход в систему</h1>

<form action="http://localhost:8888/registration">
<br>
    <input type="submit" value="Регистрация"/>
</form>

<br><br>

<@l.login "/login" />
</div>
</@p.page>
