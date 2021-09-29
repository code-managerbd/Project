<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MidTermProject_BankDemo.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
     <div class="row">
        <div class="col-12">
            <h3>Login</h3>
            <div visible="false" class="alert alert-warning alert-dismissible fade show" role="alert" id="alert" runat="server">
              <strong>Failed.</strong> Username or password invalid.
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <div class="form-group row mb-1">
       <label class="col-form-label col-form-label-sm col-2">Username</label>
        <div class="col-4">
            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="UserName" />
        </div>
    </div>
    <div class="form-group row mb-1">
       <label class="col-form-label col-form-label-sm col-2">Password</label>
        <div class="col-4">
            <asp:TextBox TextMode="Password" runat="server" CssClass="form-control form-control-sm" ID="Password" />
        </div>
    </div>
    <div class="form-group row">
       <div class="col-2">

       </div>
        <div class="col-4">
            <asp:Button CssClass="btn btn-primary btn-sm" ID="Signin" runat="server" Text="Sign in" OnClick="Signin_Click"  />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
