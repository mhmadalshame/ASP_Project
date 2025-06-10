<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddSubject.aspx.cs" Inherits="AddSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add Subject
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add New Subject</h2>
    <table>
        <tr>
            <td>Subject Name:</td>
            <td><asp:TextBox ID="txtSubjectName" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td>Passing Grade:</td>
            <td><asp:TextBox ID="txtPassingGrade" runat="server" CssClass="inputField" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnAddSubject" runat="server" Text="Add / Edit" OnClick="btnAddSubject_Click" CssClass="btnSubmit" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
            </td>
        </tr>
    </table>

    <h3>Existing Subjects</h3>
    <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False"
        DataKeyNames="SubjectID" OnRowEditing="gvSubjects_RowEditing"
        OnRowUpdating="gvSubjects_RowUpdating" OnRowCancelingEdit="gvSubjects_RowCancelingEdit">
        <Columns>
            <asp:BoundField DataField="SubjectID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
            <asp:BoundField DataField="PassingGrade" HeaderText="Passing Grade" DataFormatString="{0:F2}" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
