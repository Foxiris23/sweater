<#import "parts/common.ftlh" as c>

<@c.page>
    <div><h4>List of Users</h4></div>
    <table class="table">
        <thead>
        <tr>
            <th>User Name</th>
            <th>Email</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>${user.username}</td>
                    <td>${user.email!"none"}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.username}">Edit</a></td>
                </tr>
            </#list>
        </tbody>
    </table>
</@c.page>