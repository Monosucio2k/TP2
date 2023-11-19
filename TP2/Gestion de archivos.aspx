<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Gestion de archivos.aspx.cs" Inherits="TP2.Gestion_de_archivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 border border-primary rounded p-4">
    <label for="FileUpload1" class="btn btn-primary text-uppercase fw-bold" style="width: 100%;">Seleccione el archivo</label>
     <div class="d-flex justify-content-between align-items-center">    
 <asp:FileUpload ID="FileUpload1" CssClass="form-control text-dark "  runat="server" AllowMultiple="True"  />
         <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Subir archivo" OnClick="Button1_Click" />
    </div>
    </div></div>
       </div>
<<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
    <div class="table-responsive">
<asp:GridView ID="GridView1" CssClass="table table-hover table-success table-striped " runat="server" OnRowCommand="GridView1_RowCommand" HeaderStyle-CssClass="table-dark">
   
    <Columns >
        <asp:ButtonField ButtonType="Button" Controlstyle-CssClass="btn btn-primary btn-sm" CommandName="Descargar" HeaderText="Descargas" ShowHeader="True" Text="Descargar" ItemStyle-VerticalAlign="Middle" />
    </Columns>
</asp:GridView>
        </div>
</div>
</div>
</div>
</asp:Content>