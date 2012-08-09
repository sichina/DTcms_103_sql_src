﻿using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.SessionState;
using DTcms.Web.UI;
using DTcms.Common;

namespace DTcms.Web.Plugin.Feedback
{
    /// <summary>
    /// 管理后台AJAX处理页
    /// </summary>
    public class ajax : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //取得处事类型
            string action = DTRequest.GetQueryString("action");

            switch (action)
            {
                case "add": //发布留言
                    feedback_add(context);
                    break;
            }

        }

        #region 发布留言================================
        private void feedback_add(HttpContext context)
        {
            StringBuilder strTxt = new StringBuilder();
            BLL.feedback bll = new BLL.feedback();
            Model.feedback model = new Model.feedback();

            string _code = DTRequest.GetFormString("txtCode");
            string _title = DTRequest.GetFormString("txtTitle");
            string _content = DTRequest.GetFormString("txtContent");
            string _user_name = DTRequest.GetFormString("txtUserName");
            string _user_tel = DTRequest.GetFormString("txtUserTel");
            string _user_qq = DTRequest.GetFormString("txtUserQQ");
            string _user_email = DTRequest.GetFormString("txtUserEmail");

            //校检验证码
            if (string.IsNullOrEmpty(_code))
            {
                context.Response.Write("{msg:0, msgbox:\"对不起，请输入验证码！\"}");
                return;
            }
            if (context.Session[DTKeys.SESSION_CODE] == null)
            {
                context.Response.Write("{msg:0, msgbox:\"对不起，系统找不到生成的验证码！\"}");
                return;
            }
            if (_code.ToLower() != (context.Session[DTKeys.SESSION_CODE].ToString()).ToLower())
            {
                context.Response.Write("{msg:0, msgbox:\"您输入的验证码与系统的不一致！\"}");
                return;
            }
            if (string.IsNullOrEmpty(_content))
            {
                context.Response.Write("{msg: 0, msgbox: \"对不起，请输入留言的内容！\"}");
                return;
            }

            model.title = _title;
            model.content = Utils.ToHtml(_content);
            model.user_name = _user_name;
            model.user_tel = _user_tel;
            model.user_qq = _user_qq;
            model.user_email = _user_email;
            model.add_time = DateTime.Now;
            model.is_lock = 1; //不需要审核，请改为0
            if (bll.Add(model) > 0)
            {
                context.Response.Write("{msg: 1, msgbox: \"恭喜您，留言提交成功啦！\"}");
                return;
            }
            context.Response.Write("{msg: 0, msgbox: \"对不起，保存过程中发生错误！\"}");
            return;
        }
        #endregion

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}