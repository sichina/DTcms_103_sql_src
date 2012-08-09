<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="DTcms.Web.Plugin.LineService.admin.view" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>调用客服代码</title>
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
            success: function(lable){
                lable.ligerHideTip();
            }
        });
    });
    function CopyCode() {
        window.clipboardData.setData("Text", $("#txtCopyUrl").val());
        alert("已将代码复制至剪切板，请将其贴粘到对应的模板页即可。");
    };
</script>
</head>
<body class="mainbody">
<form id="form1" runat="server">
<div class="navigation"><a href="index.aspx" class="back">返回</a>首页 &gt; 客服管理 &gt; 调用说明</div>
<div id="contentTab">
    <ul class="tab_nav">
        <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">调用客服代码</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
        <table class="form_table">
            <col width="180px"><col>
            <tbody>
            <tr>
                <th>客服电话：</th>
                <td><asp:TextBox ID="txtPhone" runat="server" CssClass="txtInput normal required"></asp:TextBox><label>*</label></td>
            </tr>
            <tr>
                <th>初始状态：</th>
                <td>
                    <asp:RadioButtonList ID="rblStatus" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="0">最小化 </asp:ListItem>
                        <asp:ListItem Value="1">最大化 </asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th>选择皮肤：</th>
                <td>
                    <asp:RadioButtonList ID="rblSkin" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th>注意事项：</th>
                <td>
                  1、请确认页面头部已经引用了jquery类库；<br />
                  2、请复制下列代码，放到你想显示的模板页的&lt;body&gt;与&lt;/body&gt;之间的任意位置；
                </td>
            </tr>
            <tr>
                <th>复制代码：</th>
                <td>
                    <textarea id="txtCopyUrl" class="small" style="vertical-align:middle;"><script type="text/javascript" src="<%=siteConfig.webpath%>plugins/lineservice/online_js.ashx"></script></textarea>
                    <input id="btnCopy" type="button" value="复制代码" class="btnSubmit" onclick="CopyCode();" />
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                  <asp:Button ID="btnSubmit" runat="server" Text="保存设置" CssClass="btnSubmit" onclick="btnSubmit_Click" />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    
</div>
</form>
</body>
</html>
