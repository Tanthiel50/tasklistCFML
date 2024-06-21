
<cfobject component = "components.Security" name = "security">
<cfset security.checkSession()>

<cfquery datasource="tasklistDB">
    DELETE FROM tasks WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>
<cflocation url="index.cfm">
