<#import "parts/page.ftlh" as p>
<#import "parts/login.ftlh" as l>

<@p.page>
<div class="center2">
<h1> Регистрация</h1>
<br>
<#if msg_user_status??>
${msg_user_status}
<#else>
</#if>


<@l.login "/registration" />
</div>
</@p.page>