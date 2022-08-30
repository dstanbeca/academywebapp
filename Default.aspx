<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="academywebapp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="username_list_id" DataSourceID="username_jdbc" Height="118px" Width="209px">
            <Columns>
                <asp:BoundField DataField="username_list_id" HeaderText="username_list_id" InsertVisible="False" ReadOnly="True" SortExpression="username_list_id" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="username_jdbc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM username_list WHERE (username_list_id = @username_list_id)" InsertCommand="INSERT INTO username_list (username, description) VALUES (@username, @description)" SelectCommand="SELECT * FROM [username_list]">
            <DeleteParameters>
                <asp:Parameter Name="username_list_id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" />
                <asp:Parameter Name="description" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <div style="margin-left: 40px">
            <asp:Label ID="username_label" runat="server" Text="Username"></asp:Label>
        </div>
&nbsp;&nbsp;
        <asp:TextBox ID="username_text" runat="server" style="margin-left: 26px"></asp:TextBox>
        <br />
        <br />
        <div style="margin-left: 40px">
            <asp:Label ID="description_label" runat="server" Text="Description"></asp:Label>
        </div>
        &nbsp;&nbsp; <asp:TextBox ID="description_text" runat="server" style="margin-left: 26px"></asp:TextBox>
        <br />
        <br />
        <div style="margin-left: 40px">
            <asp:Button ID="Button1" runat="server" Text="Add data" OnClick="Button1_Click" />
        </div>
        <br />
        <div style="margin-left: 40px">
            <asp:TextBox ID="delete_text" runat="server"></asp:TextBox>
        </div>
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="delete_label" runat="server" OnClick="delete_label_Click" Text="Delete ID" />
        <br />
        <br />
        <div>

        </div>
    </form>
</body>
</html>
