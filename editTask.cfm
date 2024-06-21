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

    <form method="post">
        <label>Title:</label>
        <input type="text" name="title" value="#getTask.title#" required>
        <label>Description:</label>
        <textarea name="description">#getTask.description#</textarea>
        <label>Status:</label>
        <select name="status">
            <option value="pending" <cfif getTask.status eq 'pending'>selected</cfif>>Pending</option>
            <option value="completed" <cfif getTask.status eq 'completed'>selected</cfif>>Completed</option>
        </select>
        <input type="submit" name="submit" value="Update Task">
    </form>
<cfelse>
    <p>Task not found or you don't have permission to edit this task.</p>
</cfif>
