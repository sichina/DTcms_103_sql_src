﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.photo_list" ValidateRequest="false" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2012/7/14 22:43:57.
		本页面代码由DTcms模板引擎生成于 2012/7/14 22:43:57. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	const int channel_id = 5;

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
	string category_title = get_category_title(category_id,"商品展示");
	

	templateBuilder.Append("\r\n<title>");
	templateBuilder.Append(category_title.ToString());
	templateBuilder.Append(" - ");
	templateBuilder.Append(config.webname.ToString());
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/css/style.css\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("css/pagination.css\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery-1.3.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n<div class=\"container_12\">\r\n <!-- .header -->\r\n ");

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


	templateBuilder.Append("\r\n <!-- /.header -->\r\n <div class=\"clear\"></div>\r\n <div class=\"grid_8\">\r\n  ");
	string category_nav = get_category_menu("goods_list1", category_id);
	

	templateBuilder.Append("\r\n  <h2 class=\"page_title\"><a href=\"");
	templateBuilder.Append(linkurl("goods_list",""));

	templateBuilder.Append("\">商品展示</a>");
	templateBuilder.Append(category_nav.ToString());
	templateBuilder.Append("</h2>\r\n  <div class=\"page_product_list\">\r\n   <ul>\r\n    ");
	DataTable list = get_photo_list(channel_id, category_id, 9, page, "", out totalcount);
	

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n    ");
	string pagelist = get_page_link(9, page, totalcount, "goods_list1", category_id, "__id__");
	

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n    ");
	int dr__loop__id=0;
	foreach(DataRow dr in list.Rows)
	{
		dr__loop__id++;


	templateBuilder.Append("\r\n    <li><a href=\"");
	templateBuilder.Append(linkurl("goods_show",dr["id"].ToString().Trim()));

	templateBuilder.Append("\"><img src=\"" + dr["img_url"].ToString().Trim() + "\" alt=\"" + dr["title"].ToString().Trim() + "\" />\r\n    <span>" + dr["title"].ToString().Trim() + "</span></a>\r\n    <b>价格：￥" + dr["sell_price"].ToString().Trim() + "元</b>\r\n    </li>\r\n    ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n  </div>\r\n  <div class=\"line10\"></div>\r\n  <div class=\"flickr\">");
	templateBuilder.Append(pagelist.ToString());
	templateBuilder.Append("</div> <!--放置页码列表-->\r\n  <div class=\"line10\"></div>\r\n </div>\r\n <!-- end content -->\r\n <div class=\"grid_4 sidebar\">\r\n  <!--类别-->\r\n   <ul class=\"sidebar_nav\">\r\n    ");
	DataTable category_list = get_category_list(channel_id, 0);
	

	int cdr__loop__id=0;
	foreach(DataRow cdr in category_list.Rows)
	{
		cdr__loop__id++;


	templateBuilder.Append("\r\n    <li>\r\n      ");
	      int layer_width=(Convert.ToInt32(cdr["class_layer"])-1)*18;
	      

	templateBuilder.Append("\r\n      <span style=\"width:");
	templateBuilder.Append(layer_width.ToString());
	templateBuilder.Append("px;text-align:right;display:inline-block;\"></span>\r\n      <a href=\"");
	templateBuilder.Append(linkurl("goods_list1",cdr["id"].ToString().Trim(),1));

	templateBuilder.Append("\">" + cdr["title"].ToString().Trim() + "</a></li>\r\n    ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n  <!--/类别-->\r\n  <h2><a href=\"");
	templateBuilder.Append(linkurl("goods_list",""));

	templateBuilder.Append("\">商品排行榜</a></h2>\r\n  <div class=\"hot_list\">\r\n     <ul>\r\n       ");
	DataTable photo_list10 = get_photo_list(channel_id, category_id, 10, "is_lock=0", "digg_good desc,add_time desc");
	

	int pdr10__loop__id=0;
	foreach(DataRow pdr10 in photo_list10.Rows)
	{
		pdr10__loop__id++;


	if (pdr10__loop__id==1)
	{

	templateBuilder.Append("\r\n       <li class=\"first\">\r\n         <b><a href=\"");
	templateBuilder.Append(linkurl("goods_show",pdr10["id"].ToString().Trim()));

	templateBuilder.Append("\">" + pdr10["title"].ToString().Trim() + "</a></b>\r\n         <p>");
	templateBuilder.Append(Utils.DropHTML(pdr10["content"].ToString().Trim(),80));

	templateBuilder.Append("</p>\r\n       </li>\r\n       ");	continue;


	}	//end if


	templateBuilder.Append("\r\n       <li><span>( ");	templateBuilder.Append(Utils.ObjectToDateTime(pdr10["add_time"].ToString().Trim()).ToString("MM-dd"));

	templateBuilder.Append(" )</span><a href=\"");
	templateBuilder.Append(linkurl("goods_show",pdr10["id"].ToString().Trim()));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.DropHTML(pdr10["title"].ToString().Trim(),28));

	templateBuilder.Append("</a></li>\r\n       ");
	}	//end loop


	templateBuilder.Append("\r\n     </ul>\r\n   </div>\r\n  \r\n </div>\r\n <!-- end sidebar -->\r\n <!-- .footer -->\r\n ");

	templateBuilder.Append(" <div class=\"clear\"></div>\r\n <div class=\"grid_12 footer\"> <a href=\"#\" class=\"back_to_top\">top</a>\r\n   <p>");
	templateBuilder.Append(config.webcopyright.ToString());
	templateBuilder.Append(" &nbsp;");
	templateBuilder.Append(config.webcountcode.ToString());
	templateBuilder.Append("</p>\r\n </div>\r\n <div class=\"clear\"></div>");


	templateBuilder.Append("\r\n <!-- /.footer -->\r\n</div>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>