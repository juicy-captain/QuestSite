using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Model;
using Database;
using Interface;
public partial class App_Page_AdminUsers : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private UserModel UserModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
        }
        PopulateUsers();
    }

    void PopulateUsers()
    {
        DatabaseResponse<List<UserModel>> databaseResponse = new DatabaseRequest<List<UserModel>>()
        {
            RequestType = RequestType.GetAllUsers
        }.Execute();

        foreach (UserModel player in databaseResponse.Result)
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            Label names = new Label() { Text = player.ToString() };
            Label bithDate = new Label() { Text = String.Format("{0:dd.MM.yyyy}", new DateTime(player.BirthDate)) };
            string genderString = "Пол: " + (player.Gender == UserModel.Sex.Male ? "муж" : "мен") + ".";
            Label gender = new Label() { Text = genderString };
            Image avatar = new Image() { ImageUrl = player.AvatarPath };

            Button deleteButton = new Button() { Text = "Удалить", ID = player.Id.ToString(), PostBackUrl = "~/App_Page/AdminUsers.aspx" };
            deleteButton.Click += (sender, args) =>
                {
                    new DatabaseRequest<object>()
                    {
                        RequestType = RequestType.DeleteUser,
                        PlayerId = int.Parse((sender as Button).ID)
                    }.Execute();
                };
            HtmlGenericControl br = new HtmlGenericControl("<br>");

            //TODO remove this crappy code before course project vindication
            div.Controls.Add(names);
            div.Controls.Add(br);
            div.Controls.Add(bithDate);
            div.Controls.Add(br);
            div.Controls.Add(gender);
            div.Controls.Add(br);
            div.Controls.Add(avatar);
            div.Controls.Add(br);
            div.Controls.Add(deleteButton);
            div.Controls.Add(br);
            content.Controls.Add(div);
        }
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

}