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
    public partial class bar_list : DTcms.Web.UI.ManagePage
    {
        protected int aid;
        protected string keywords = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.aid = DTRequest.GetQueryInt("aid");
            this.keywords = DTRequest.GetQueryString("keywords");
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
            if (!Page.IsPostBack)
            {
                RptBind("aid=" + this.aid + CombSqlTxt(this.keywords), "is_lock asc,sort_id asc,add_time desc");
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.txtKeywords.Text = this.keywords;
            BLL.advert_banner bll = new BLL.advert_banner();
            this.rptList.DataSource = bll.GetList(0, _strWhere, _orderby);
            this.rptList.DataBind();
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and title like '%" + _keywords + "%'");
            }
            return strTemp.ToString();
        }
        #endregion

        #region 返回广告条状态===========================
        protected string GetState(string strLock, string startTime, string endTime)
        {
            if (int.Parse(strLock) == 1)
            {
                return "<font color=\"#999999\">暂停</font>";
            }
            else if (DateTime.Compare(DateTime.Parse(startTime), DateTime.Today) > 0)
            {
                return "<font color=\"#009900\">未生效</font>";
            }
            else if (DateTime.Compare(DateTime.Parse(endTime), DateTime.Today) == -1)
            {
                return "<font color=\"#FF0000\">已过期</font>";
            }
            else
            {
                return "<font color=\"#009900\">正常</font>";
            }
        }
        #endregion

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("bar_list.aspx", "aid={0}&keywords={1}", this.aid.ToString(), txtKeywords.Text));
        }

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            BLL.advert_banner bll = new BLL.advert_banner();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.Delete(id);
                }
            }
            JscriptMsg("批量删除成功啦！", Utils.CombUrlTxt("bar_list.aspx", "aid={0}&keywords={0}", this.aid.ToString(), this.keywords), "Success");
        }

    }
}