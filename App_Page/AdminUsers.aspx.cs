﻿using System;
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
    private UserModel UserModel { get; set; }

    static App_Page_AdminUsers()
    {
        Processor = new UserBatchProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
        }
        PopulateUsers();
    }

    //methods for simplification logic understanding
    private void PopulateUsers()
    {
        List<UserModel> userModels = PerformGetAllUsersRequest();

        foreach (UserModel player in userModels)
        {
            HtmlGenericControl div = new HtmlGenericControl("div");
            Label names = new Label() { Text = player.ToString() };
            Label bithDate = new Label() { Text = String.Format("{0:dd.MM.yyyy}", new DateTime(player.BirthDate)) };
            string genderString = "Пол: " + (player.Gender == Sex.Male ? "муж" : "мен") + ".";
            Label gender = new Label() { Text = genderString };
            Image avatar = new Image() { ImageUrl = player.AvatarPath };

            Button deleteButton = new Button() { Text = "Удалить", ID = player.Id.ToString(), PostBackUrl = "~/App_Page/AdminUsers.aspx" };
            deleteButton.Click += (sender, args) =>
                {
                    PerformDeleteUserRequest();
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
    private List<UserModel> PerformGetAllUsersRequest()
    {
        DatabaseResponse<List<UserModel>> response = new DatabaseRequest1<List<UserModel>>()
        {
            Processor = Processor,
            RequestType = RequestType1.Query,
            StoredProcedure = DatabaseConst.SPGetAllUsers
        }.Execute();
        return response.Result;
    }
    private void PerformDeleteUserRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterUserId, UserModel.Id}
        };
        new DatabaseRequest1<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType1.Insert,
            StoredProcedure = DatabaseConst.SPDeleteUser
        }.Execute();
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

}