using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected override void OnLoad(EventArgs e)
    {
        // Skip check for Admin.aspx as it has its own login panel, 
        // OR if already logged in as Admin
        if (Request.Url.AbsolutePath.EndsWith("Admin.aspx", StringComparison.OrdinalIgnoreCase) || Session["AdminUser"] != null)
        {
            base.OnLoad(e);
            return;
        }

        // If session is lost, try to restore it from the persistent cookie
        if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
        {
            HttpCookie loginCookie = Request.Cookies["UserLoginPersistence"];
            if (loginCookie != null)
            {
                Session["IsLoggedIn"] = true;
                Session["UserName"] = loginCookie.Values["UserName"];
                Session["UserID"] = loginCookie.Values["UserID"];
            }
        }

        // Now check if the user is logged in
        if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
        {
            Response.Redirect("Login.aspx");
        }
        base.OnLoad(e);
    }
}
