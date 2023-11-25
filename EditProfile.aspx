<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="DCS2102_GroupAssignment2.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="EditProfile.css" rel="stylesheet" />
    <title>Edit Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="text-align: center;">~ Edit Profile Section ~</h1>
         
        <!-- Displaying the Header -->
        <div id="editProfile_container">
            <div class="row">

                <!-- Update User Picture and About Me Info -->
                <div class="column_profile">
                     <div class="profile_section">
                        <img id="profilePicture" runat="server" src="Images\profile_pic_unknown.jpg"  alt="Profile Image" />
                        <br />
                        <asp:HiddenField ID="ImagePathHiddenField" runat="server" />
                        <asp:FileUpload runat="server" ID="FileUpload1"></asp:FileUpload>
                        <br />
                        <h3>
                            <asp:Label runat="server" Text="About Me:" />

                            <br />
                            <asp:TextBox ID="TextArea1" runat="server" TextMode="MultiLine" ViewStateMode="Enabled"></asp:TextBox>
                            <br />

                        </h3>
                        <asp:Button runat="server" Text="Cancel" ID="Button1"></asp:Button>
                        <asp:Button runat="server" Text="Save" ID="Button2" OnClick="Button2_Click"></asp:Button>

                    </div>
                </div>

                <!-- Update/Change the Username -->
                <div class="column_changePassword">
                    <div class="changePassword_section ">
                        <div id="changeUsernameForm">
                            <h1>Change Username</h1>

                            <h3>
                                <asp:Label runat="server" Text="Current Username:"></asp:Label>
                                <br />
                                <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                                <br />
                                <asp:Label runat="server" Text="New Username:"></asp:Label>
                                <br />
                                <asp:TextBox runat="server" ID="TextBox2"></asp:TextBox>

                            </h3>
                            <asp:Button runat="server" Text="Cancel" ID="Button3"></asp:Button>
                            <asp:Button runat="server" Text="Save" ID="Button4" OnClick="Button4_Click"></asp:Button>

                        </div>

                        <!-- Udate/Change the User password -->
                        <h1>Change Password</h1>
                        <div id="changePasswordForm">
                            <h3>
                                <asp:Label runat="server" Text="Current Password"></asp:Label>
                                <br />
                                <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
                                <br />
                                <asp:Label runat="server" Text="New Password"></asp:Label>
                                <br />
                                <asp:TextBox runat="server" ID="TextBox4"></asp:TextBox>
                                <br />
                                <asp:Label runat="server" Text="Confirm New Password:"></asp:Label>
                                <br />
                                <asp:TextBox runat="server" ID="TextBox5"></asp:TextBox>
                            </h3>
                            <asp:Button runat="server" Text="Cancel" ID="Button5"></asp:Button>
                            <asp:Button runat="server" Text="Save" ID="Button6" OnClick="Button6_Click"></asp:Button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
   
</body>
</html>
