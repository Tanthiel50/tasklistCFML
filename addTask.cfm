<cfobject component = "components.Header" name = "header">
<cfset headerHtml = header.displayHeader()>
<cfoutput>#headerHtml#</cfoutput>

<cfobject component = "components.Navbar" name = "navbar">
<cfset navbarHtml = navbar.displayNavbar()>
<cfoutput>#navbarHtml#</cfoutput>

<cfobject component = "components.Security" name = "security">
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

    <section class="section">
        <div class="container">
            <h1 class="title">Add Task</h1>
            <form method="post">
                <div class="field">
                    <label class="label">Title:</label>
                    <div class="control">
                        <input class="input" type="text" name="title" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">Description:</label>
                    <div class="control">
                        <textarea class="textarea" name="description"></textarea>
                    </div>
                </div>
                <div class="field">
                    <div class="control">
                        <button class="button is-primary" type="submit" name="submit">Add Task</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
