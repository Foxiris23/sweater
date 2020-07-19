<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>

    <#if message??>
        <div class="mt-2 mb-2">
        <mark>${message}</mark>
        </div>
    </#if>
    <#if error??>
        <div class="alert alert-danger mt-2 mb-2" role="alert">
            ${error}
        </div>
    </#if>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="New password"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="passwordConfirm" class="form-control" placeholder="Retype new password"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="Email" value="${email!""}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>