<cfobject component="Security" name="security">
<cfset security.checkSession()>

<cfif structKeyExists(form, "submit")>
    <cfquery datasource="tasklistDB">
        INSERT INTO tasks (title, description, status, user_id)
        VALUES (
            <cfqueryparam value="#form.title#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.description#" cfsqltype="cf_sql_varchar">,
            'pending',
            <cfqueryparam value="#session.user_id#" cfsqltype="cf_sql_integer">
        )
    </cfquery>
    <cflocation url="index.cfm">
</cfif>

<form method="post">
    <label>Title:</label>
    <input type="text" name="title" required>
    <label>Description:</label>
    <textarea name="description"></textarea>
    <input type="submit" name="submit" value="Add Task">
</form>
