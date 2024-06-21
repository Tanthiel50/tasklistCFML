<cfobject component = "components.Header" name = "header">
<cfset headerHtml = header.displayHeader()>
<cfoutput>#headerHtml#</cfoutput>

<cfif structKeyExists(form, "submit")>
    <cfquery name="getUser" datasource="tasklistDB">
        SELECT * FROM users WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    </cfquery>
    
    <cfif getUser.recordCount EQ 1 AND getUser.password EQ hash(form.password, "SHA-256")>
        <cfset session.user_id = getUser.id>
        <cfset session.loggedIn = true>
        <cflocation url="index.cfm">
    <cfelse>
        <p>Invalid username or password.</p>
    </cfif>
</cfif>

<form method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    <label>Password:</label>
    <input type="password" name="password" required>
    <input type="submit" name="submit" value="Login">
</form>
