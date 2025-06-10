<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddTeacher.aspx.cs" Inherits="AddTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add Teacher
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add New Teacher</h2>
    <table>
        <tr>
            <td>Name:</td>
            <td><asp:TextBox ID="txtTeacherName" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td>Father's Name:</td>
            <td><asp:TextBox ID="txtTeacherFname" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td>Mother's Name:</td>
            <td><asp:TextBox ID="txtTeacherMname" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td><asp:TextBox ID="txtTeacherBirthDate" runat="server" CssClass="inputField" placeholder="yyyy-MM-dd" /></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><asp:TextBox ID="txtTeacherPhone" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td>Subjects Taught:</td>
            <td>
                <asp:CheckBoxList ID="chkSubjects" runat="server" RepeatColumns="3" CssClass="checkboxlist" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnAddTeacher" runat="server" Text="Add" OnClick="btnAddTeacher_Click" CssClass="btnSubmit" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
            </td>
        </tr>
    </table>
</asp:Content>
