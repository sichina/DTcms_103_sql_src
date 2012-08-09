using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.Plugin.Link.admin
{
    public partial class link_edit : DTcms.Web.UI.ManagePage
    {
        private string action = ActionEnum.Add.ToString(); //操作类型
        private int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = Request.QueryString["action"];

            if (!string.IsNullOrEmpty(_action) && _action == ActionEnum.Edit.ToString())
            {
                this.action = ActionEnum.Edit.ToString();//修改类型
                if (!int.TryParse(Request.QueryString["id"] as string, out this.id))
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.link().Exists(this.id))
                {
                    JscriptMsg("信息不存在或已被删除！", "back", "Error");
                    return;
                }
            }
            if (!Page.IsPostBack)
            {
                if (action == ActionEnum.Edit.ToString()) //修改
                {
                    ShowInfo(this.id);
                }
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.link bll = new BLL.link();
            Model.link model = bll.GetModel(_id);

            txtTitle.Text = model.title;
            rblIsRed.SelectedValue = model.is_red.ToString();
            rblIsLock.SelectedValue = model.is_lock.ToString();
            txtSortId.Text = model.sort_id.ToString();
            txtUserName.Text = model.user_name;
            txtUserTel.Text = model.user_tel;
            txtEmail.Text = model.email;
            txtSiteUrl.Text = model.site_url;
            txtImgUrl.Text = model.img_url;
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = true;
            Model.link model = new Model.link();
            BLL.link bll = new BLL.link();

            model.title = txtTitle.Text.Trim();
            model.is_lock = int.Parse(rblIsLock.SelectedValue);
            model.is_red = int.Parse(rblIsRed.SelectedValue);
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.user_name = txtUserName.Text.Trim();
            model.user_tel = txtUserTel.Text.Trim();
            model.email = txtEmail.Text.Trim();
            model.site_url = txtSiteUrl.Text.Trim();
            model.img_url = txtImgUrl.Text.Trim();
            model.is_image = 1;
            if (string.IsNullOrEmpty(model.img_url))
            {
                model.is_image = 0;
            }
            if (bll.Add(model) < 1)
            {
                result = false;
            }
            return result;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            bool result = true;
            BLL.link bll = new BLL.link();
            Model.link model = bll.GetModel(_id);

            model.title = txtTitle.Text.Trim();
            model.is_lock = int.Parse(rblIsLock.SelectedValue);
            model.is_red = int.Parse(rblIsRed.SelectedValue);
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.user_name = txtUserName.Text.Trim();
            model.user_tel = txtUserTel.Text.Trim();
            model.email = txtEmail.Text.Trim();
            model.site_url = txtSiteUrl.Text.Trim();
            model.img_url = txtImgUrl.Text.Trim();
            model.is_image = 1;
            if (string.IsNullOrEmpty(model.img_url))
            {
                model.is_image = 0;
            }
            if (!bll.Update(model))
            {
                result = false;
            }

            return result;
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == ActionEnum.Edit.ToString()) //修改
            {
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("修改成功啦！", "index.aspx", "Success");
            }
            else //添加
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加成功啦！", "index.aspx", "Success");
            }
        }

    }
}