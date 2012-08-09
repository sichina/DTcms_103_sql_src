<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bar_edit.aspx.cs" Inherits="DTcms.Web.Plugin.Advert.admin.bar_edit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑广告内容</title>
<link href="../../../scripts/ui/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="../../../<%=siteConfig.webmanagepath %>/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../../scripts/jquery/jquery.form.js"></script>
<script type="text/javascript" src="../../../scripts/jquery/jquery.validate.min.js"></script> 
<script type="text/javascript" src="../../../scripts/jquery/messages_cn.js"></script>
<script type="text/javascript" src="../../../scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="../../../scripts/calendar.js"></script>
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
<div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 插件管理 &gt; 广告内容</div>
<div id="contentTab">
    <ul class="tab_nav">
        <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">编辑广告内容</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
        <table class="form_table">
            <col width="180px"><col>
            <tbody>
            <tr>
                <th>所属广告位：</th>
                <td><asp:Literal ID="LitTitle" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <th>活动状态：</th>
                <td>
                    <asp:RadioButtonList ID="rblIsLock" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="0">正常 </asp:ListItem>
                        <asp:ListItem Value="1">暂停 </asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th>排 序：</th>
                <td><asp:TextBox ID="txtSortId" runat="server" CssClass="txtInput normal small required digits">99</asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>广告名称：</th>
                <td><asp:TextBox ID="txtTitle" runat="server" CssClass="txtInput normal required" minlength="2" maxlength="255"></asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>投放时间：</th>
                <td><asp:TextBox ID="txtStartTime" runat="server" CssClass="txtInput normal required dateISO" onclick="return Calendar('txtStartTime');"></asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>到期时间：</th>
                <td><asp:TextBox ID="txtEndTime" runat="server" CssClass="txtInput normal required dateISO" onclick="return Calendar('txtEndTime');"></asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>链接网址：</th>
                <td><asp:TextBox ID="txtLinkUrl" runat="server" CssClass="txtInput normal required" maxlength="255"></asp:TextBox><label>*URL地址</label></td>
            </tr>
            <tr>
                <th>上传文件：</th>
                <td>
                    <asp:TextBox ID="txtFilePath" runat="server" CssClass="txtInput normal left" maxlength="255"></asp:TextBox>
                    <a href="javascript:;" class="files"><input type="file" id="FileUpload" name="FileUpload" onchange="Upload('SingleFile', 'txtFilePath', 'FileUpload', 0, 0, '../../../');" /></a>
                    <span class="uploading">正在上传，请稍候...</span>
                </td>
            </tr>
            <tr>
                <th>备注(代码)：</th>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" maxlength="255" TextMode="MultiLine" CssClass="small"></asp:TextBox>
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
