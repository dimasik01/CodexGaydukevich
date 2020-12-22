<#import "parts/page.ftlh" as p>
<#import "parts/login.ftlh" as l>
<@p.page>
<!-- -------------------- User data -------------------- -->
<#if user??>
<h3> Ваши данные:</h3>

<table>
    <thead>
    <tr>
        <th>Имя</th>
        <th>Роль</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role> ${role}<#sep>, </#list></td>
    </tr>
    </tbody>
</table>
<#else>
</#if>

<br><br><br>



<#if user??>
    <@l.logout />
<#else>
<div class="center">
    <@l.goToLink "/registration" "Регистрация"/>
        <br>
        <@l.goToLink "/login" "Вход в систему"/>
        <br>
    </div>
</#if>




<#if user??>
    <#if user.roles?seq_contains("ADMIN")>

    <br>
    <button type="submit" onclick=" window.open('/h2','_blank')">Управление Базой Данных</button>
<br>

<br>
<@l.goToLink "/userList" "Список пользователей"/>

    </#if>
</#if>


<#if user??>
<#if user.roles?seq_contains("ADMIN") || user.roles?seq_contains("USER")>

<!-- -------------------- Codex section -------------------- -->
<br><br>
<H3>Кодексы:</H3>

<table>
    <tr>
        <th>Должность</th>
        <th>Ссылка</th>
    </tr>
    <#list codex as cod>
    <tr>
        <td><b>${cod.jobPosition}</b></td>
        <td><a href="${cod.link}" target="_blank">Кодекс</a></td>
    </tr>
</#list>
</table>


<!-- -------------------- Employee section -------------------- -->


<H3>Список сотрудников:</H3>

<table>
    <tr>
        <th>ID</th>
        <th>Имя</th>
        <th>Компания</th>
        <th>Должность</th>
    </tr>
    <#list employees as e>
        <tr>
            <td><b>${e.id}</b></td>
            <td><span>${e.name}</span></td>
            <td><span>${e.companyName}</span></td>
            <td><span>${e.jobPosition}</span></td>
        </tr>
    <#else>
    Коллекция пуста
    </#list>
</table>

 <!-- -------------------- Company section -------------------- -->

<H3>Список компаний:</H3>

<table>
    <tr>
        <th>Название</th>
        <#if user??><#if user.roles?seq_contains("ADMIN")><th>Кол-во сотрудников</th></#if></#if>
    </tr>
    <#list companies as company>
        <tr>
            <td><b>${company.name}</b></td>
            <#if user??><#if user.roles?seq_contains("ADMIN")><td><span>${company.staffNumber}</span></td></#if></#if>
        </tr>
    </#list>
</table>

<!-- -------------------- Payment section -------------------- -->

<H3>Зарплаты:</H3>

<table>
    <tr>
        <th>ID сотрудника</th>
        <th>Страна</th>
        <#if user??><#if user.roles?seq_contains("ADMIN")><th>Зар. плата</th></#if></#if>
    </tr>
    <#list payments as payment>
        <tr>
            <td><span>${payment.employeeId}</span></td>
            <td><span>${payment.countryName}</span></td>
            <#if user??><#if user.roles?seq_contains("ADMIN")><td><span>${payment.payment}</span></td></#if></#if>
        </tr>
    </#list>
</table>

<!-- -------------------- Currency section -------------------- -->

<H3>Валюты:</H3>

<table>
    <tr>
        <th>Страна</th>
        <th>Валюта</th>
    </tr>
    <#list currencies as currency>
        <tr>
            <td><b>${currency.countryName}</b></td>
            <td><span>${currency.currency}</span></td>
        </tr>
    </#list>
</table>


</#if>
</#if>


</@p.page>