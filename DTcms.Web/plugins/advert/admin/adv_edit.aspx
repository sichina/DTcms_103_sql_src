<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adv_edit.aspx.cs" Inherits="DTcms.Web.Plugin.Advert.admin.adv_edit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑广告位</title>
<link href="../../../scripts/ui/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="../../../<%=siteConfig.webmanagepath %>/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../../scripts/jquery/jquery.validate.min.js"></script> 
<script type="text/javascript" src="../../../scripts/jquery/messages_cn.js"></script>
<script type="text/javascript" src="../../../scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="../../../<%=siteConfig.webmanagepath %>/js/function.js"></script>
<script type="text/javascript">
    //表单验证
    $(function () {
        $("#form1").validate({
            errorPlacement: function (lable, element) {
                element.ligerTip({ content: lable.html(), appendIdTo: lable });
            },
            success: function (lable) {
                lable.ligerHideTip();
            }
        });
    });
</script>
</head>
<body class="mainbody">
<form id="form1" runat="server">
<div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 插件管理 &gt; 广告位管理</div>
<div id="contentTab">
    <ul class="tab_nav">
        <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">编辑广告位</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
        <table class="form_table">
            <col width="180px"><col>
            <tbody>
            <tr>
                <th>广告位名称：</th>
                <td><asp:TextBox ID="txtTitle" runat="server" CssClass="txtInput normal required" minlength="2" maxlength="255"></asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>广告类型：</th>
                <td>
                    <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                         <asp:ListItem Selected="True" Value="1">文字 </asp:ListItem>
                         <asp:ListItem Value="2">图片 </asp:ListItem>
                         <asp:ListItem Value="3">幻灯片 </asp:ListItem>
                         <asp:ListItem Value="4">动画 </asp:ListItem>
                         <asp:ListItem Value="5">FLV视频 </asp:ListItem>
                         <asp:ListItem Value="6">代码 </asp:ListItem>
                     </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th>备注说明：</th>
                <td>
                    <asp:TextBox ID="txtRemark" runat="server" maxlength="255" TextMode="MultiLine" CssClass="small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>显示数量：</th>
                <td>
                    <asp:TextBox ID="txtViewNum" runat="server" CssClass="txtInput normal small required digits"></asp:TextBox><label>*</label>
                </td>
            </tr>
            <tr>
                <th>价格：</th>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="txtInput normal small required number">0</asp:TextBox><label>*元/月</label>
                </td>
            </tr>
            <tr>
                <th>宽度：</th>
                <td>
                    <asp:TextBox ID="txtViewWidth" runat="server" CssClass="txtInput normal small required digits"></asp:TextBox><label>*</label>
                </td>
            </tr>
            <tr>
                <th>高度：</th>
                <td>
                    <asp:TextBox ID="txtViewHeight" runat="server" CssClass="txtInput normal small required digits"></asp:TextBox><label>*</label>
                </td>
            </tr>
            <tr>
                <th>链接目标：</th>
                <td>
                    <asp:RadioButtonList ID="rblTarget" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                         <asp:ListItem Selected="True" Value="_blank">新窗口 </asp:ListItem>
                         <asp:ListItem Value="_self">原窗口 </asp:ListItem>
                     </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th></th>
                <td><asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btnSubmit" onclick="btnSubmit_Click" /></td>
            </tr>
            </tbody>
        </table>
    </div>
    
</div>
</form>
</body>
</html>
