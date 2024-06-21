component {
    public void function checkSession() {
        if (!structKeyExists(session, "loggedIn") OR !session.loggedIn) {
            cflocation(url="login.cfm");
        }
    }
}