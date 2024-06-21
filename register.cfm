<cfif structKeyExists(form, "submit")>
    <!--- Hash the password before storing it in the database --->
    <cfset hashedPassword = hash(form.password, "SHA-256")>
    <cfquery datasource="tasklistDB">
        INSERT INTO users (username, password)
        VALUES (
            <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
    <cflocation url="login.cfm">
</cfif>

<form method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    <label>Password:</label>
    <input type="password" name="password" required>
    <input type="submit" name="submit" value="Register">
</form>

<a href="login.cfm">Need to login ?</a>
