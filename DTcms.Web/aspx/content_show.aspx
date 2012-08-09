<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.content_show" ValidateRequest="false" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created at 2012-8-9 13:58:24.
		本页面代码生成于 2012-8-9 13:58:24. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	const int channel_id = 4;

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>");
	templateBuilder.Append(model.title.ToString());
	templateBuilder.Append(" - ");
	templateBuilder.Append(config.webname.ToString());
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery-1.3.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n<div class=\"container_12\">\r\n  <!-- .header -->\r\n ");

	templateBuilder.Append(" <div class=\"grid_4\">\r\n   <h1><a href=\"");
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

	templateBuilder.Append("\">联系我们</a></li>\r\n  </ul>\r\n </div>\r\n <!-- /.nav -->");


	templateBuilder.Append("\r\n <!-- /.header -->\r\n <div class=\"clear\"></div>\r\n <div class=\"grid_8\">\r\n  <h2 class=\"page_title\"><a>");
	templateBuilder.Append(model.title.ToString());
	templateBuilder.Append("</a></h2>\r\n  <div class=\"page_content\">\r\n   ");
	templateBuilder.Append(model.content.ToString());
	templateBuilder.Append("\r\n  </div>\r\n  <div class=\"line10\"></div>\r\n  <!--分享-->\r\n  ");

	templateBuilder.Append("  <!-- JiaThis Button BEGIN --> \r\n  <div id=\"ckepop\">\r\n      <span class=\"jiathis_txt\">分享到：</span>\r\n      <a class=\"jiathis_button_tqq\">腾讯微博</a>\r\n      <a class=\"jiathis_button_tsina\">新浪微博</a>\r\n      <a class=\"jiathis_button_renren\">人人网</a>\r\n      <a class=\"jiathis_button_email\">邮件</a>\r\n      <a class=\"jiathis_button_fav\">收藏夹</a>\r\n      <a class=\"jiathis_button_copy\">复制网址</a> \r\n      <a href=\"http://www.jiathis.com/share/?uid=90225\" class=\"jiathis jiathis_txt jiathis_separator jtico jtico_jiathis\" target=\"_blank\">更多</a> \r\n      <a class=\"jiathis_counter_style\"></a> \r\n  </div> \r\n  <!-- JiaThis Button END -->\r\n  <script type=\"text/javascript\">var jiathis_config={data_track_clickback:true};</");
	templateBuilder.Append("script> \r\n  <script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js?uid=1336353133859589\" charset=\"utf-8\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n  <!--/分享-->\r\n  <div class=\"line10\"></div>\r\n </div>\r\n <!-- end content -->\r\n <div class=\"grid_4 sidebar\">\r\n  <!--类别-->\r\n   <ul class=\"sidebar_nav\">\r\n    ");
	DataTable contentlist = get_content_list(channel_id, 0, 0, "is_lock=0");
	

	int cdr__loop__id=0;
	foreach(DataRow cdr in contentlist.Rows)
	{
		cdr__loop__id++;


	templateBuilder.Append("\r\n    <li>\r\n      <a href=\"");
	templateBuilder.Append(linkurl("content",cdr["call_index"].ToString().Trim()));

	templateBuilder.Append("\">" + cdr["title"].ToString().Trim() + "</a></li>\r\n    ");
	}	//end loop


	templateBuilder.Append("\r\n   </ul>\r\n   <!--/类别-->\r\n  <h2><a href=\"");
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


	templateBuilder.Append("\r\n  </ul>\r\n  \r\n </div>\r\n <!-- end sidebar -->\r\n <!-- .footer -->\r\n ");

	templateBuilder.Append(" <div class=\"clear\"></div>\r\n <div class=\"grid_12 footer\"> <a href=\"#\" class=\"back_to_top\">top</a>\r\n   <p>");
	templateBuilder.Append(config.webcopyright.ToString());
	templateBuilder.Append(" &nbsp;");
	templateBuilder.Append(config.webcountcode.ToString());
	templateBuilder.Append("</p>\r\n </div>\r\n <div class=\"clear\"></div>");


	templateBuilder.Append("\r\n <!-- /.footer -->\r\n</div>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
