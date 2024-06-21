<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Manager</title>
    <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css"
>
</head>

<cfobject component="Security" name="security">
<cfset security.checkSession()>

<cfquery name="getTasks" datasource="tasklistDB">
    SELECT * FROM tasks WHERE user_id = <cfqueryparam value="#session.user_id#" cfsqltype="cf_sql_integer">
</cfquery>

<body>
    <section class="section">
        <div class="container">
            <h1 class="title">Task Manager</h1>
            <a class="button is-primary" href="addTask.cfm">Add Task</a>
            <table class="table is-striped is-fullwidth">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <cfoutput query="getTasks">
                        <tr>
                            <td>#title#</td>
                            <td>#description#</td>
                            <td>#status#</td>
                            <td>
                                <a class="button is-small is-warning" href="editTask.cfm?id=#id#">Edit</a>
                                <a class="button is-small is-danger" href="deleteTask.cfm?id=#id#">Delete</a>
                            </td>
                        </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    </section>
</body>
</html>