<cfquery datasource="tasklistDB">
    ALTER TABLE tasks ADD COLUMN user_id INT;
</cfquery>
<p>Table users alter successfully.</p>