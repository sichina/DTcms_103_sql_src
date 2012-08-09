using System;
using System.Text;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTcms.Common;

namespace DTcms.Web.Plugin.Advert.admin
{
    public partial class bar_edit : DTcms.Web.UI.ManagePage
    {
        private string action = ActionEnum.Add.ToString(); //操作类型
        protected int aid;
        protected int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = DTRequest.GetQueryString("action");
            if (!string.IsNullOrEmpty(_action) && _action == ActionEnum.Edit.ToString())
            {
                this.action = ActionEnum.Edit.ToString();//修改类型
                this.id = DTRequest.GetQueryInt("id");
                if (this.id < 1)
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.advert_banner().Exists(this.id))
                {
                    JscriptMsg("信息不存在或已被删除！", "back", "Error");
                    return;
                }
            }
            else
            {
                this.aid = DTRequest.GetQueryInt("aid");
                if (this.aid < 1)
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.advert().Exists(this.aid))
                {
                    JscriptMsg("广告位不存在或已删除！", "back", "Error");
                    return;
                }
                LitTitle.Text = new BLL.advert().GetTitle(aid);
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
            BLL.advert_banner bll = new BLL.advert_banner();
            Model.advert_banner model = bll.GetModel(_id);

            this.aid = model.aid;
            LitTitle.Text = new BLL.advert().GetTitle(aid);
            txtTitle.Text = model.title;
            rblIsLock.SelectedValue = model.is_lock.ToString();
            txtSortId.Text = model.sort_id.ToString();
            txtStartTime.Text = model.start_time.ToString("yyyy-MM-dd");
            txtEndTime.Text = model.end_time.ToString("yyyy-MM-dd");
            txtLinkUrl.Text = model.link_url;
            txtFilePath.Text = model.file_path;
            txtContent.Text = model.content;
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = true;
            Model.advert_banner model = new Model.advert_banner();
            BLL.advert_banner bll = new BLL.advert_banner();

            model.aid = this.aid;
            model.title = txtTitle.Text.Trim();
            model.start_time = DateTime.Parse(this.txtStartTime.Text.Trim());
            model.end_time = DateTime.Parse(this.txtEndTime.Text.Trim());
            model.file_path = txtFilePath.Text.Trim();
            model.link_url = txtLinkUrl.Text.Trim();
            model.content = txtContent.Text;
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.is_lock = int.Parse(rblIsLock.SelectedValue);
            model.add_time = DateTime.Now;

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
            BLL.advert_banner bll = new BLL.advert_banner();
            Model.advert_banner model = bll.GetModel(_id);

            this.aid = model.aid;
            model.title = txtTitle.Text.Trim();
            model.start_time = DateTime.Parse(this.txtStartTime.Text.Trim());
            model.end_time = DateTime.Parse(this.txtEndTime.Text.Trim());
            model.file_path = txtFilePath.Text.Trim();
            model.link_url = txtLinkUrl.Text.Trim();
            model.content = txtContent.Text;
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.is_lock = int.Parse(rblIsLock.SelectedValue);

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
                JscriptMsg("编辑成功啦！", "bar_list.aspx?aid=" + this.aid.ToString(), "Success");
            }
            else //添加
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加成功啦！", "bar_list.aspx?aid=" + this.aid.ToString(), "Success");
            }
        }

    }
}