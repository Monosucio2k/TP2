using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP2
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["password"];
                this.TextBox5.Text = cookie != null ? cookie.Value : string.Empty;
                if (this.Session["nombreUsuario"] != null)
                {
                    this.TextBox1.Text = this.Session["nombreUsuario"].ToString();
                }
                else
                {
                    this.TextBox1.Text = string.Empty;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate("Group1");
            if (Page.IsValid)
            {
                HttpCookie cookie1 = new HttpCookie("password", this.TextBox5.Text);
                cookie1.Expires = DateTime.Now.AddSeconds(360);
                Response.Cookies.Add(cookie1);
                this.Session["nombreUsuario"] = this.TextBox1.Text;
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarMensaje", "alert('Registro exitoso'); window.location.href = '" + Request.RawUrl + "';", true);

            }
        }


    }

}