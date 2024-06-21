component
{
    
    public string function displayNavbar()
    {
        var navbar = '
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="https://bulma.io">
                    <img src="https://seeklogo.com/images/B/bulma-logo-45B5145BF4-seeklogo.com.png" alt="Bulma logo">
                </a>
                <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">';
        
        if(!structKeyExists(session, "loggedIn") || !session.loggedIn)
        {
            navbar &= '
                <div class="navbar-start"></div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <a class="button is-primary" href="register.cfm">
                                <strong>Sign up</strong>
                            </a>
                            <a class="button is-light" href="login.cfm">
                                Log in
                            </a>
                        </div>
                    </div>
                </div>';
        }
        else
        {
            navbar &= '
                <div class="navbar-start">
                    <a class="navbar-item" href="index.cfm">Home</a>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">More</a>
                        <div class="navbar-dropdown">
                            <a class="navbar-item">Parameters</a>
                            <hr class="navbar-divider">
                            <a class="navbar-item">Report an issue</a>
                        </div>
                    </div>
                </div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <a class="button is-light" href="logout.cfm">Log out</a>
                    </div>
                </div>';
        }
    
        navbar &= '
            </div>
        </nav>';
    
        return navbar;
    }
    
}