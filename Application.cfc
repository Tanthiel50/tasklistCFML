component {
    this.name = "tasklistApp";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0); // 30 minutes

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {
        session.loggedIn = false;
        return true;
    }

    function onRequestStart(string targetPage) {
        if (!structKeyExists(session, "loggedIn")) {
            session.loggedIn = false;
        }
        if (!session.loggedIn && listFindNoCase("index.cfm,addTask.cfm,editTask.cfm,deleteTask.cfm", targetPage)) {
            cflocation(url="login.cfm");
        }
        return true;
    }
}
