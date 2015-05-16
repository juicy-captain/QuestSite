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
using Processor;
public partial class App_Page_AdminUsers : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private static IProcessor<List<UserModel>> Processor { get; set; }
    private static UserModel AdminModel { get; set; }
    private static List<UserModel> UserModels { get; set; }

    static App_Page_AdminUsers()
    {
        Processor = new UserBatchProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            AdminModel = sourcePage.GetModel();
            PopulateUsers();
        }
    }
    protected void ButtonRemoveAll_Click(object sender, EventArgs e)
    {
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPDeleteAllUsers
        }.Execute();
    }

    //methods for simplification logic understanding
    private void PopulateUsers()
    {
        PerformGetAllUsersRequest();

        foreach (UserModel player in UserModels)
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            Label names = new Label() { Text = player.ToString() };
            Label bithDate = new Label() { Text = String.Format("{0:dd.MM.yyyy}", new DateTime(player.BirthDate)) };
            string genderString = "Пол: " + (player.Gender == Sex.Male ? "муж" : "мен") + ".";
            Label gender = new Label() { Text = genderString };
            Image avatar = new Image() { ImageUrl = player.AvatarPath };

            Button deleteButton = new Button() { Text = "Удалить", ID = player.Id.ToString() };
            deleteButton.Click += (sender, args) =>
                {
                    int userId = int.Parse((sender as Button).ID);
                    PerformDeleteUserRequest(userId);
                    Server.Transfer("~/App_Page/AdminUsers.aspx", true);
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
    private void PerformGetAllUsersRequest()
    {
        DatabaseResponse<List<UserModel>> response = new DatabaseRequest<List<UserModel>>()
        {
            Processor = Processor,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetAllUsers
        }.Execute();
        UserModels = response.Result;
    }
    private void PerformDeleteUserRequest(int userId)
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterUserId, userId}
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPDeleteUser
        }.Execute();
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return AdminModel;
    }

}