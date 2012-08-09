<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="group_list.aspx.cs" Inherits="DTcms.Web.Plugin.LineService.admin.group_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客服分组管理</title>
<link type="text/css" rel="stylesheet" href="../../../scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="../../../<%=siteConfig.webmanagepath %>/images/style.css" />
<script type="text/javascript" src="../../../scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../../scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="../../../<%=siteConfig.webmanagepath %>/js/function.js"></script>
</head>
<body class="mainbody">
<form id="form1" runat="server">
    <div class="navigation">首页 &gt; 插件管理 &gt; 在线客服 &gt; 客服分组</div>
    <div class="tools_box">
	    <div class="tools_bar">
            <a href="group_edit.aspx?action=<%=ActionEnum.Add %>" class="tools_btn"><span><b class="add">添加分组</b></span></a>
		    <a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn"><span><b class="all">全选</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn"  
                OnClientClick="return ExePostBack('btnDelete');" onclick="btnDelete_Click"><span><b class="delete">批量删除</b></span></asp:LinkButton>
            <a href="index.aspx" class="tools_btn"><span><b class="return">客服列表</b></span></a>
        </div>
    </div>

    <!--列表展示.开始-->
    <asp:Repeater ID="rptList" runat="server" onitemcommand="rptList_ItemCommand">
    <HeaderTemplate>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th align="left">分组名称</th>
        <th width="13%" align="left">默认展开</th>
        <th width="60" align="left">排序</th>
        <th width="60">状态</th>
        <th width="8%">操作</th>
      </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr>
        <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" /><asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" /></td>
        <td><a href="group_edit.aspx?action=<%#ActionEnum.Edit %>&id=<%#Eval("id")%>"><%#Eval("title")%></a></td>
        <td><%# Convert.ToInt32(Eval("default_view")) == 1 ? "是" : "否"%></td>
        <td align="center"><%#Eval("sort_id")%></td>
        <td align="center">
          <asp:ImageButton ID="ibtnLock" CommandName="ibtnlock" runat="server" ImageUrl='<%# Convert.ToInt32(Eval("is_lock")) == 0 ? "../../../"+siteConfig.webmanagepath+"/images/ico-0.png" : "../../../"+siteConfig.webmanagepath+"/images/ico-0_.png"%>' ToolTip='<%# Convert.ToInt32(Eval("is_lock")) == 1 ? "点击启用" : "点击禁用"%>' />
        </td>
        <td align="center"><a href="group_edit.aspx?action=<%#ActionEnum.Edit %>&id=<%#Eval("id")%>">修改</a></td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
      <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">暂无记录</td></tr>" : ""%>
      </table>
    </FooterTemplate>
    </asp:Repeater>
    <!--列表展示.结束-->
    <div class="line10"></div>

</form>
</body>
</html>
