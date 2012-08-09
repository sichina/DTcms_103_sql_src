<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adv_view.aspx.cs" Inherits="DTcms.Web.Plugin.Advert.admin.adv_view" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>调用广告</title>
<link href="../../../<%=siteConfig.webmanagepath %>/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btnCopy").bind("click", function () {
            window.clipboardData.setData("Text", $("#txtCopyUrl").val());
            alert("已将代码复制至剪切板，请将其贴粘到指定位置即可。");
        });
    });
    </script>
</head>
<body class="mainbody">
<form id="form1" runat="server">
<div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 插件管理 &gt; 广告管理 &gt; 调用广告</div>
<div id="contentTab">
    <ul class="tab_nav">
        <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">调用广告</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
        <table class="form_table">
            <col width="180px"><col>
            <tbody>
            <tr>
                <th>广告名称：</th>
                <td><%=model.title %></td>
            </tr>
            <tr>
                <th>广告类型：</th>
                <td>
                    <%= GetTypeName(model.type) %>
                </td>
            </tr>
            <tr>
                <th>备注说明：</th>
                <td><%=model.remark%></td>
            </tr>
            <tr>
                <th>显示数量：</th>
                <td><%=model.view_num%></td>
            </tr>
            <tr>
                <th>显示大小：</th>
                <td><%=model.view_width%>×<%=model.view_height%>px</td>
            </tr>
            <tr>
                <th>链接目标：</th>
                <td><%=model.target%></td>
            </tr>
            <tr>
                <th>调用说明：</th>
                <td>
                    <div style="color:#060;">
                      1、暂停、过期的广告不会在网站上显示；<br />
                      2、请确保该插件目录下的player.swf（FLV插放器）、focus.swf（幻灯片）的存在，否则无法显示广告；<br />
                      3、除广告类型为幻灯片、视频、代码外，如该广告位下存在多条广告时，均以&ltul&gt;&ltli&gt;...&lt/li&gt;&lt/ul&gt;包括进行输出；<br />
                      4、广告以JS形式输出，可使用CSS进行控制其样式，前提是您熟悉HTML、DIV、CSS的知识；<br />
                      5、了解上述，请将复制下列的代码粘贴于网站模板所对应的广告位中。
                    </div>
                </td>
            </tr>
            <tr>
                <th>复制代码：</th>
                <td>
                    <textarea id="txtCopyUrl" class="small" style="vertical-align:middle;"><script type="text/javascript" src="<%=siteConfig.webpath%>plugins/advert/advert_js.ashx?id=<%=model.id%>"></script></textarea>&nbsp; <input id="btnCopy" type="button" value="复制代码" class="btnSubmit" style="vertical-align:middle;" />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    
</div>
</form>
</body>
</html>
