﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.Plugin.Feedback.feedback" ValidateRequest="false" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created at 2012-8-9 13:54:54.
		本页面代码生成于 2012-8-9 13:54:54. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>在线留言 - ");
	templateBuilder.Append(config.webname.ToString());
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/ui/skins/Aqua/css/ligerui-all.css\" />\r\n<link type=\"text/css\" rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("css/pagination.css\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery-1.3.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery.form.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery.validate.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/messages_cn.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/ui/js/ligerBuild.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	//初始化发表评论表单\r\n	AjaxOnSubmit('comment_form', 'btnSubmit', '");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("plugins/feedback/ajax.ashx?action=add');\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n<div class=\"container_12\">\r\n <!-- .header -->\r\n <div class=\"grid_4\">\r\n   <h1><a href=\"");
	templateBuilder.Append(config.weburl.ToString());
	templateBuilder.Append("\">DTcms v1.0</a></h1>\r\n </div>\r\n <div class=\"search\">\r\n   <input id=\"keywords\" name=\"keywords\" type=\"text\" class=\"search_text\" value=\"输入关健字\" onfocus=\"javascript:if(this.value=='输入关健字')this.value='';\" onblur=\"javascript:if(this.value=='')this.value='输入关健字'\" />\r\n   <input type=\"button\" value=\"搜索\" class=\"search_button\" onclick=\"SiteSearch('");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("search.aspx', '#keywords');\" />\r\n </div>\r\n <!-- .nav -->\r\n <div class=\"clear\"></div>\r\n <div class=\"nav\">\r\n  <ul>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("index",""));

	templateBuilder.Append("\">首 页</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("article_list",""));

	templateBuilder.Append("\">新闻资讯</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("goods_list",""));

	templateBuilder.Append("\">商品展示</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("photo_list",""));

	templateBuilder.Append("\">图片分享</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("down_list",""));

	templateBuilder.Append("\">资源下载</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("feedback",""));

	templateBuilder.Append("\">在线留言</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\">关于我们</a></li>\r\n   <li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n  </ul>\r\n </div>\r\n <!-- /.nav -->\r\n <!-- /.header -->\r\n <div class=\"clear\"></div>\r\n <div class=\"grid_8\">\r\n   <h2 class=\"page_title\"><a href=\"news.html\">在线留言</a></h2>\r\n   <div class=\"comment_box\" style=\"padding-top:0; border:0; \">\r\n     <div class=\"comment_list\"> \r\n       <ul>\r\n         ");
	DataTable plist = new DTcms.Web.Plugin.Feedback.feedback().get_feedback_list(10, page, "", out totalcount);
	

	string pagelist = get_page_link(10, page, totalcount, "feedback1", "__id__");
	

	int list__loop__id=0;
	foreach(DataRow list in plist.Rows)
	{
		list__loop__id++;


	templateBuilder.Append("\r\n         <li>\r\n           <div class=\"title\"><span>" + list["add_time"].ToString().Trim() + "</span>" + list["user_name"].ToString().Trim() + "</div>\r\n           <div class=\"box\">\r\n             " + list["content"].ToString().Trim() + "\r\n           </div>\r\n           ");
	if (list["reply_content"].ToString().Trim()!="")
	{

	templateBuilder.Append("\r\n           <div class=\"reply\">\r\n             <strong>管理员回复：</strong>" + list["reply_content"].ToString().Trim() + "\r\n             <span class=\"time\">" + list["reply_time"].ToString().Trim() + "</span>\r\n           </div>\r\n           ");
	}	//end if


	templateBuilder.Append("\r\n         </li>\r\n         ");
	}	//end loop


	templateBuilder.Append("\r\n       </ul>\r\n       <div class=\"line10\"></div>\r\n       <div class=\"flickr\">");
	templateBuilder.Append(pagelist.ToString());
	templateBuilder.Append("</div> <!--放置页码列表-->\r\n     </div>\r\n     <div class=\"line10\"></div>\r\n     <h3 class=\"add\">发表留言<a name=\"Add\" id=\"Add\"></a></h3>\r\n     <form id=\"comment_form\" name=\"comment_form\">\r\n     <div class=\"feedback_add\">\r\n       <dl>\r\n         <dt>用户昵称：</dt>\r\n         <dd><input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"text normal required\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>联系电话：</dt>\r\n         <dd><input id=\"txtUserTel\" name=\"txtUserTel\" type=\"text\" class=\"text  normal\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>在线QQ：</dt>\r\n         <dd><input id=\"txtUserQQ\" name=\"txtUserQQ\" type=\"text\" class=\"text  normal\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>电子邮箱：</dt>\r\n         <dd><input id=\"txtUserEmail\" name=\"txtUserEmail\" type=\"text\" class=\"text  normal\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>留言标题：</dt>\r\n         <dd><input id=\"txtTitle\" name=\"txtTitle\" type=\"text\" class=\"text normal required\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>留言内容：</dt>\r\n         <dd><textarea id=\"txtContent\" name=\"txtContent\" class=\"text required\"></textarea></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>验证码：</dt>\r\n         <dd>\r\n           <span class=\"fright\"><input name=\"btnSubmit\" type=\"submit\" value=\"发表留言\" class=\"submit\" /></span>\r\n           <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"text required\" style=\"width:80px;\" />\r\n           <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" /> 看不清楚？</a>\r\n         </dd>\r\n       </dl>\r\n     </div>\r\n     <div class=\"clear\"></div>\r\n     <input type=\"hidden\" id=\"turl\" value=\"");
	templateBuilder.Append(linkurl("feedback",""));

	templateBuilder.Append("\" />\r\n     </form>\r\n   </div>\r\n </div>\r\n \r\n <!-- end content -->\r\n <div class=\"grid_4 sidebar\">\r\n  <ul class=\"sidebar_nav\">\r\n    ");
	DataTable contentlist = get_content_list(4, 0, 0, "is_lock=0");
	

	int cdr__loop__id=0;
	foreach(DataRow cdr in contentlist.Rows)
	{
		cdr__loop__id++;


	templateBuilder.Append("\r\n    <li>\r\n      <a href=\"");
	templateBuilder.Append(linkurl("content",cdr["call_index"].ToString().Trim()));

	templateBuilder.Append("\">" + cdr["title"].ToString().Trim() + "</a></li>\r\n    ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n  <h2><a href=\"");
	templateBuilder.Append(linkurl("article_list",""));

	templateBuilder.Append("\">最新资讯</a></h2>\r\n  <ul class=\"news_list\">\r\n   ");
	DataTable article_list = get_article_list(1, 0, 8, "is_lock=0");
	

	int adr__loop__id=0;
	foreach(DataRow adr in article_list.Rows)
	{
		adr__loop__id++;


	templateBuilder.Append("\r\n   <li><span>( ");	templateBuilder.Append(Utils.ObjectToDateTime(adr["add_time"].ToString().Trim()).ToString("MM-dd"));

	templateBuilder.Append(" )</span><a href=\"");
	templateBuilder.Append(linkurl("article_show",adr["id"].ToString().Trim()));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.DropHTML(adr["title"].ToString().Trim(),32));

	templateBuilder.Append("</a></li>\r\n   ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n  \r\n </div>\r\n <!-- end sidebar -->\r\n <!-- .footer -->\r\n <div class=\"clear\"></div>\r\n <div class=\"grid_12 footer\"> <a href=\"#\" class=\"back_to_top\">top</a>\r\n   <p>");
	templateBuilder.Append(config.webcopyright.ToString());
	templateBuilder.Append(" &nbsp;");
	templateBuilder.Append(config.webcountcode.ToString());
	templateBuilder.Append("</p>\r\n </div>\r\n <div class=\"clear\"></div>\r\n <!-- /.footer -->\r\n</div>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
