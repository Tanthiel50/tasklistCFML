<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
</head>
<body>
<cfobject component="Security" name="security">
<cfset security.checkSession()>

<cfquery name="getTask" datasource="tasklistDB">
    SELECT * FROM tasks WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer"> AND user_id = <cfqueryparam value="#session.user_id#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif getTask.recordCount EQ 1>
    <cfif structKeyExists(form, "submit")>
        <cfquery datasource="tasklistDB">
            UPDATE tasks
            SET title = <cfqueryparam value="#form.title#" cfsqltype="cf_sql_varchar">,
                description = <cfqueryparam value="#form.description#" cfsqltype="cf_sql_varchar">,
                status = <cfqueryparam value="#form.status#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
            AND user_id = <cfqueryparam value="#session.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cflocation url="index.cfm">
    </cfif>

<section class="section">
        <div class="container">
            <h1 class="title">Modify Task</h1>
    <form method="post">

    <div class="field">
        <label class="label">Title:</label>
        <div class="control">
            <input class = "input" type = "text" name = "title" value = "<cfoutput> #getTask.title#</cfoutput>"required>
        </div>
    </div>
    <div class="field">
    <label class = "label">
    Description:
    </label>
    <textarea class = "textarea" name = "description">
    <cfoutput >
            #getTask.description#
        </cfoutput> 
    </textarea>
    </div>
    <div class="field"> 
    <label class = "label">
    Status:
    </label>
        <select class = "select" name="status">
            <option class = "option" value="pending" <cfif getTask.status eq 'pending'>selected</cfif>>Pending</option>
            <option class= "option" value="completed" <cfif getTask.status eq 'completed'>selected</cfif>>Completed</option>
        </select>
    </div>
        <input class="button is-primary" type="submit" name="submit" value="Update Task">
    </form>
<cfelse>
    <p class="has-text-centered" >Task not found or you don't have permission to edit this task.</p>
</cfif>
</div>
    </section>
</body>
</html>
