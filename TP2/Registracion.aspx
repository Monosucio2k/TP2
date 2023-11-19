<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="TP2.Registracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 29px;
    }
        .auto-style2 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 border border-primary rounded p-4">
<asp:ValidationSummary ID="ValidationSummary1" CssClass="card text-white bg-danger mb-3"  runat="server" ForeColor="" ValidationGroup="Group1" />

<div class="form-group">
  <label class="btn btn-primary text-uppercase fw-bold" style="width: 100%;">Resgistro</label>
<div class="form-floating">
    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="User Name" runat="server"></asp:TextBox> 
    <label for="TextBox1">User Name</label>
<!-- validaciones -->
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo UserName no puede estar vacío" Text="El campo UserName no puede estar vacío" ControlToValidate="TextBox1" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:RequiredFieldValidator>
<!-- end-validaciones -->
  </div>
  <div class="form-floating mb-3">
                <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="ejemplo@dom.ar" runat="server"></asp:TextBox>
    <label for="TextBox2">Email address</label>
<!-- validaciones -->
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo Email no puede estar vacio" ControlToValidate="TextBox2" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="La Email debe ser de un formato válido" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="None" ValidationGroup="Group1"></asp:RegularExpressionValidator>

<!-- validaciones -->
  </div>
<div class="form-floating">
        <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Edad" runat="server" TextMode="Number"></asp:TextBox> 
    <label for="TextBox3">Edad</label>
<!-- validaciones -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo Edad no puede estar vacio" ControlToValidate="TextBox3" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:RequiredFieldValidator><br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Debe ser mayor de 15 años" MaximumValue="99" MinimumValue="16" ForeColor="Red" ControlToValidate="TextBox3" Display="None" ValidationGroup="Group1"></asp:RangeValidator>

<!-- validaciones -->
  </div>
  <div class="form-floating">
                <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
    <label for="TextBox4">Password</label>
<!-- validaciones -->
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo Contraseña no puede estar vacio" ControlToValidate="TextBox4" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:RequiredFieldValidator>

<!-- validaciones -->
  </div>
<div class="form-floating">
                <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
    <label for="TextBox5">Reingrese el Password</label>
<!-- validaciones -->
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo de reingreso de Contraseña no puede estar vacio" ControlToValidate="TextBox5" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:RequiredFieldValidator><br />
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ForeColor="Red" Display="None" ValidationGroup="Group1"></asp:CompareValidator>
<!-- validaciones -->
  </div>
<div class="form-group">
    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Registrar" OnClick="Button1_Click" ValidationGroup="Group1" />
    </div>
</div>
 </div>
        </div>
    </div>
</asp:Content>