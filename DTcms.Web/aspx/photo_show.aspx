<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.photo_show" ValidateRequest="false" %>
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
	const int channel_id = 2;

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
	string category_title = get_category_title(model.category_id,"图片分享");
	

	templateBuilder.Append("\r\n<title>");
	templateBuilder.Append(model.title.ToString());
	templateBuilder.Append(" - ");
	templateBuilder.Append(category_title.ToString());
	templateBuilder.Append(" - ");
	templateBuilder.Append(config.webname.ToString());
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/ui/skins/Aqua/css/ligerui-all.css\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery-1.3.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/ui/js/ligerBuild.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/slide.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.templateskin.ToString());
	templateBuilder.Append("/js/digg_ajax.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	$(function(){\r\n		bindDigg('");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("', 'photo', '");
	templateBuilder.Append(model.id.ToString());
	templateBuilder.Append("');\r\n	});\r\n</");
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
	string category_nav = get_category_menu("photo_list1", model.category_id);
	

	templateBuilder.Append("\r\n  <h2 class=\"page_title_view\"><a href=\"");
	templateBuilder.Append(linkurl("photo_list",""));

	templateBuilder.Append("\">图片分享</a>");
	templateBuilder.Append(category_nav.ToString());
	templateBuilder.Append("</h2>\r\n  <h3 class=\"page_news_title\">");
	templateBuilder.Append(model.title.ToString());
	templateBuilder.Append("</h3>\r\n  <i class=\"page_news_date\">\r\n   ");
	templateBuilder.Append(model.add_time.ToString());
	templateBuilder.Append("&nbsp;&nbsp; 人气：");
	templateBuilder.Append(model.click.ToString());
	templateBuilder.Append("次&nbsp;&nbsp; \r\n   <!--扩展属性开始-->\r\n    ");
	if (model.photo_attribute_values!=null)
	{

	int modelt2__loop__id=0;
	foreach(DTcms.Model.photo_attribute_value modelt2 in model.photo_attribute_values)
	{
		modelt2__loop__id++;


	templateBuilder.Append("\r\n    ");
	templateBuilder.Append(modelt2.title.ToString());
	templateBuilder.Append("：");
	templateBuilder.Append(modelt2.content.ToString());
	templateBuilder.Append("&nbsp;&nbsp; \r\n    ");
	}	//end loop


	}	//end if


	templateBuilder.Append("\r\n   <!--扩展属性结束-->\r\n  </i>\r\n  <!--幻灯片开始-->\r\n  <div class=\"slide_box\">\r\n    <div id=\"pic_box\" class=\"pic_box\">\r\n      <a class=\"big_prev\"></a><a class=\"big_next\"></a>\r\n      <div id=\"pic_show\"></div>\r\n    </div>\r\n    <div class=\"scroll_box\">\r\n      <a class=\"small_prev\"></a><a class=\"small_next\"></a>\r\n      <div id=\"pic_scroll\" class=\"items\">\r\n        <ul>\r\n          ");
	if (model.photo_albums!=null)
	{

	int modelt1__loop__id=0;
	foreach(DTcms.Model.photo_album modelt1 in model.photo_albums)
	{
		modelt1__loop__id++;


	templateBuilder.Append("\r\n          <li><a href=\"javascript:;\"><img bimg=\"");
	templateBuilder.Append(modelt1.big_img.ToString());
	templateBuilder.Append("\" src=\"");
	templateBuilder.Append(modelt1.small_img.ToString());
	templateBuilder.Append("\" /></a></li>\r\n          ");
	}	//end loop


	}	//end if


	templateBuilder.Append("\r\n        </ul>\r\n       </div>\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n  </div>\r\n  <!--幻灯片结束-->\r\n  <div class=\"line10\"></div>\r\n  <div class=\"page_content\">\r\n   ");
	templateBuilder.Append(model.content.ToString());
	templateBuilder.Append("\r\n  </div>\r\n  <div class=\"line10\"></div>\r\n  <!--分享-->\r\n  ");

	templateBuilder.Append("  <!-- JiaThis Button BEGIN --> \r\n  <div id=\"ckepop\">\r\n      <span class=\"jiathis_txt\">分享到：</span>\r\n      <a class=\"jiathis_button_tqq\">腾讯微博</a>\r\n      <a class=\"jiathis_button_tsina\">新浪微博</a>\r\n      <a class=\"jiathis_button_renren\">人人网</a>\r\n      <a class=\"jiathis_button_email\">邮件</a>\r\n      <a class=\"jiathis_button_fav\">收藏夹</a>\r\n      <a class=\"jiathis_button_copy\">复制网址</a> \r\n      <a href=\"http://www.jiathis.com/share/?uid=90225\" class=\"jiathis jiathis_txt jiathis_separator jtico jtico_jiathis\" target=\"_blank\">更多</a> \r\n      <a class=\"jiathis_counter_style\"></a> \r\n  </div> \r\n  <!-- JiaThis Button END -->\r\n  <script type=\"text/javascript\">var jiathis_config={data_track_clickback:true};</");
	templateBuilder.Append("script> \r\n  <script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js?uid=1336353133859589\" charset=\"utf-8\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n  <!--/分享-->\r\n  <div class=\"line10\"></div>\r\n  <!--顶踩-->\r\n  ");

	templateBuilder.Append("  <div class=\"newdigg\" id=\"newdigg\">\r\n    <div id=\"digg_good\" class=\"diggbox digg_good\">\r\n      <div class=\"digg_act\">顶一下</div>\r\n      <div class=\"digg_num\">(");
	templateBuilder.Append(model.digg_good.ToString());
	templateBuilder.Append(")</div>\r\n      <div class=\"digg_percent\">\r\n        ");
	        decimal good_num = 0;
	        if(model.digg_good>0){
	          good_num = decimal.Round((decimal)model.digg_good/(model.digg_good + model.digg_act)*100,1);
	        }
	        

	templateBuilder.Append("\r\n        <div class=\"digg_percent_bar\"><span style=\"width:");
	templateBuilder.Append(good_num.ToString());
	templateBuilder.Append("%\"></span></div>\r\n        <div class=\"digg_percent_num\">");
	templateBuilder.Append(good_num.ToString());
	templateBuilder.Append("%</div>\r\n      </div>\r\n    </div>\r\n    <div id=\"digg_bad\" class=\"diggbox digg_bad\">\r\n      <div class=\"digg_act\">踩一下</div>\r\n      <div class=\"digg_num\">(");
	templateBuilder.Append(model.digg_act.ToString());
	templateBuilder.Append(")</div>\r\n      <div class=\"digg_percent\">\r\n        ");
	        decimal act_num = 0;
	        if(model.digg_act>0){
	          act_num = decimal.Round((decimal)model.digg_act/(model.digg_good + model.digg_act)*100,1);
	        }
	        

	templateBuilder.Append("\r\n        <div class=\"digg_percent_bar\"><span style=\"width:");
	templateBuilder.Append(act_num.ToString());
	templateBuilder.Append("%\"></span></div>\r\n        <div class=\"digg_percent_num\">");
	templateBuilder.Append(act_num.ToString());
	templateBuilder.Append("%</div>\r\n      </div>\r\n    </div>\r\n  </div>");


	templateBuilder.Append("\r\n  <!--/项踩-->\r\n  <h3>推荐图片</h3>\r\n  <ul class=\"other_news_list\">\r\n   ");
	DataTable photo_list5 = get_photo_list(channel_id, model.category_id, 5, "is_lock=0 and is_red=1");
	

	int pdr5__loop__id=0;
	foreach(DataRow pdr5 in photo_list5.Rows)
	{
		pdr5__loop__id++;


	templateBuilder.Append("\r\n   <li><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("photo_show",pdr5["id"].ToString().Trim()));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.DropHTML(pdr5["title"].ToString().Trim(),82));

	templateBuilder.Append("</a><span>( ");	templateBuilder.Append(Utils.ObjectToDateTime(pdr5["add_time"].ToString().Trim()).ToString("yyyy-MM-dd"));

	templateBuilder.Append(" )</span></li>\r\n   ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n  <!--评论-->\r\n  ");
	if (model.is_msg==1)
	{


	int comment_count = get_comment_count(channel_id, model.id, "is_lock=0");
	

	templateBuilder.Append("<!--取得评论总数-->\r\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("css/pagination.css\" />\r\n  <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery.form.js\"></");
	templateBuilder.Append("script>\r\n  <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery.validate.min.js\"></");
	templateBuilder.Append("script>\r\n  <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/messages_cn.js\"></");
	templateBuilder.Append("script>\r\n  <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("scripts/jquery/jquery.pagination.js\"></");
	templateBuilder.Append("script>\r\n  <script type=\"text/javascript\">\r\n    $(function(){\r\n	  //初始化评论列表\r\n	  AjaxPageList('#comment_list', '#pagination', 10, ");
	templateBuilder.Append(comment_count.ToString());
	templateBuilder.Append(", '");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_list&channel_id=");
	templateBuilder.Append(model.channel_id.ToString());
	templateBuilder.Append("&content_id=");
	templateBuilder.Append(model.id.ToString());
	templateBuilder.Append("');\r\n	  //初始化发表评论表单\r\n      AjaxOnSubmit('comment_form', 'btnSubmit', '");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_add&channel_id=");
	templateBuilder.Append(model.channel_id.ToString());
	templateBuilder.Append("&content_id=");
	templateBuilder.Append(model.id.ToString());
	templateBuilder.Append("');\r\n	});\r\n  </");
	templateBuilder.Append("script>\r\n  <div class=\"comment_box\">\r\n    <h3><span><a href=\"#Add\" class=\"blulink\">已有");
	templateBuilder.Append(comment_count.ToString());
	templateBuilder.Append("条评论，点击发表评论</a></span>最新评论</h3>\r\n    <div class=\"comment_list\">\r\n      <ul id=\"comment_list\">暂无评论，快来抢沙发吧！</ul>\r\n    </div>\r\n    <div id=\"pagination\" class=\"flickr\"></div><!--放置页码-->\r\n    <h3 class=\"add\">发表评论<a name=\"Add\" id=\"Add\"></a></h3>\r\n    <form id=\"comment_form\" name=\"comment_form\">\r\n    <div class=\"comment_add\">\r\n      <input type=\"hidden\" id=\"txtTitle\" name=\"txtTitle\" value=\"");
	templateBuilder.Append(model.title.ToString());
	templateBuilder.Append("\" />\r\n      <textarea id=\"txtContent\" name=\"txtContent\" class=\"text required\"></textarea>\r\n      <div class=\"btns\">\r\n        <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"发表评论\" class=\"submit\" />\r\n        <span>验证码：</span>\r\n        <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"text required\" style=\"width:80px;\" />\r\n        <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(config.webpath.ToString());
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" /> 看不清楚？</a>\r\n      </div>\r\n    </div>\r\n    </form>\r\n  </div>");


	templateBuilder.Append("\r\n  <input type=\"hidden\" id=\"turl\" value=\"");
	templateBuilder.Append(linkurl("photo_show",model.id));

	templateBuilder.Append("\" />\r\n  ");
	}	//end if


	templateBuilder.Append("\r\n  <!--/评论-->\r\n </div>\r\n <!-- end content -->\r\n <div class=\"grid_4 sidebar\">\r\n  <!--类别-->\r\n   <ul class=\"sidebar_nav\">\r\n    ");
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
	templateBuilder.Append(linkurl("photo_list1",cdr["id"].ToString().Trim(),1));

	templateBuilder.Append("\">" + cdr["title"].ToString().Trim() + "</a></li>\r\n    ");
	}	//end loop


	templateBuilder.Append("\r\n   </ul>\r\n <!--/类别-->\r\n  <h2><a href=\"");
	templateBuilder.Append(linkurl("photo_list",""));

	templateBuilder.Append("\">热门图片</a></h2>\r\n  <ul class=\"news_list\">\r\n   ");
	DataTable photo_top8 = get_photo_list(channel_id, model.category_id, 8, "is_lock=0", "click desc,add_time desc");
	

	int pdr8__loop__id=0;
	foreach(DataRow pdr8 in photo_top8.Rows)
	{
		pdr8__loop__id++;


	templateBuilder.Append("\r\n   <li><span>( 人气:" + pdr8["click"].ToString().Trim() + " )</span><a href=\"");
	templateBuilder.Append(linkurl("photo_show",pdr8["id"].ToString().Trim()));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.DropHTML(pdr8["title"].ToString().Trim(),32));

	templateBuilder.Append("</a></li>\r\n   ");
	}	//end loop


	templateBuilder.Append("\r\n  </ul>\r\n\r\n </div>\r\n <!-- end sidebar -->\r\n <!-- .footer -->\r\n ");

	templateBuilder.Append(" <div class=\"clear\"></div>\r\n <div class=\"grid_12 footer\"> <a href=\"#\" class=\"back_to_top\">top</a>\r\n   <p>");
	templateBuilder.Append(config.webcopyright.ToString());
	templateBuilder.Append(" &nbsp;");
	templateBuilder.Append(config.webcountcode.ToString());
	templateBuilder.Append("</p>\r\n </div>\r\n <div class=\"clear\"></div>");


	templateBuilder.Append("\r\n <!-- /.footer -->\r\n</div>\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
