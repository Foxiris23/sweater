<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>User editor</h2>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/user" method="post">
                <div class="form-group">
                    <label for="inputUsername">User Name:</label>
                    <input class="form-control" id="inputUsername" type="text" name="username" value="${user.username}">
                </div>
                <#list roles as role>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input"  id="gridCheck" type="checkbox"
                               name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                        <label class="form-check-label" for="gridCheck">${role}</label>

                    </div>
                </div>
                </#list>
                <input type="hidden" value="${user.username}" name="name">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button class="btn btn-primary" type="submit">Save</button>
            </form>
        </div>
    </div>
</@c.page>