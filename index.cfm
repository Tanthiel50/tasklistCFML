<cfobject component="Security" name="security">
<cfset security.checkSession()>

<cfquery name="getTasks" datasource="tasklistDB">
    SELECT * FROM tasks WHERE user_id = <cfqueryparam value="#session.user_id#" cfsqltype="cf_sql_integer">
</cfquery>

<h1>Task Manager</h1>
<a href="addTask.cfm">Add Task</a>
<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <cfoutput query="getTasks">
        <tr>
            <td>#title#</td>
            <td>#description#</td>
            <td>#status#</td>
            <td>
                <a href="editTask.cfm?id=#id#">Edit</a>
                <a href="deleteTask.cfm?id=#id#">Delete</a>
            </td>
        </tr>
    </cfoutput>
</table>
