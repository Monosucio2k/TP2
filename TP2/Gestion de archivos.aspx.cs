using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace TP2
{
    public partial class Gestion_de_archivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGrill();
        }

        public void FillGrill()
        {
            if (this.Session["nombreUsuario"] != null)
            {
                string userDirectory = this.Session["nombreUsuario"].ToString();

                string path = $"{Server.MapPath(".")}/{userDirectory}";


                if (Directory.Exists(path))
                {
                    string[] files = Directory.GetFiles(path);
                    List<Archivo> fileList = new List<Archivo>();
                    foreach (var file in files)
                    {
                        var filesName = new Archivo(Path.GetFileName(file), file);
                        fileList.Add(filesName);
                    }
                    GridView1.DataSource = fileList;
                    GridView1.DataBind();

                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.Session["nombreUsuario"] != null)
            {
                string userDirectory = this.Session["nombreUsuario"].ToString();
                string path = $"{Server.MapPath(".")}/{userDirectory}";


                if (!Directory.Exists(path))
                {

                    Directory.CreateDirectory(path);


                }


                foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                {
                    //verifico que FileUpload1 tenga archivos
                    if (FileUpload1.HasFiles)
                    {
                        //verifico que el disco de almacenamiento tenga memoria sufiente
                        if (AbailableSpace(FileUpload1.PostedFiles))
                        {

                            archivo.SaveAs($"{path}/{archivo.FileName}");
                        }
                        else
                        {
                            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "MostrarMensaje", "alert('No hay suficiente espacio en el disco'); window.location.href = '" + Request.RawUrl + "';", true);
                        }
                    }
                }
                FillGrill();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "MostrarMensaje", "alert('Debe iniciar Session para poder subir un archivo'); window.location.href = '" + Request.RawUrl + "';", true);
            }
        }
        //funcion para obtener la letra designada a la unidad de almacenamiento
        static string GetDriveLetter(string path)
        {
            // Verifica que la ruta no sea nula ni vacía
            if (!string.IsNullOrEmpty(path))
            {
                // Obtiene la letra de la unidad desde la ruta
                //la ruta minima que puede tener el path es letraUnindad: (c:) y el segundo lugar del array contiene ":"
                //se crea la subcadena que optiene la letra de la unidad de disco
                if (path.Length >= 2 && path[1] == ':')
                {
                    return path.Substring(0, 1);
                }
            }

            // En caso de que no se pueda determinar la letra de la unidad, devuelve una cadena vacía
            return string.Empty;
        }
        //funcion para verificar si hay espacio sufiente para almacenar los archivos subidos
        protected bool AbailableSpace(IList<System.Web.HttpPostedFile> files)
        {
            long totalSize = 0;
            string path = $"{Server.MapPath(".")}";
            string uniDisc = GetDriveLetter(path);

            foreach (HttpPostedFile archivo in files)
            {
                // Añadir el tamaño de cada archivo a la suma total
                totalSize += archivo.ContentLength;
            }
            DriveInfo driveInfo = new DriveInfo(uniDisc);
            long availableSpace = driveInfo.AvailableFreeSpace;
            //se verifica que el tamaño total de archivos sea mayor al espacio disponible en el disco
            if (availableSpace < totalSize)
            {

                return false;

            }
            else
            {
                return true;
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;
                string encodedFileName = HttpUtility.UrlDecode(Path.GetFileName(filePath));
                System.Diagnostics.Debug.WriteLine("Ruta antes de TransmitFile: " + filePath);
                Response.ContentType = "aplication/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + encodedFileName);
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}