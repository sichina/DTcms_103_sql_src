<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bar_list.aspx.cs" Inherits="DTcms.Web.Plugin.Advert.admin.bar_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>广告内容管理</title>
<link type="text/css" rel="stylesheet" href="../../../scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="../../../<%=siteConfig.webmanagepath %>/images/style.css" />
<link type="text/css" rel="stylesheet" href="../../../css/pagination.css" />
<script type="text/javascript" src="../../../scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../../scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="../../../<%=siteConfig.webmanagepath %>/js/function.js"></script>
</head>
<body class="mainbody">
<form id="form1" runat="server">
    <div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 插件管理 &gt; 广告内容 &gt; 广告位：<asp:Literal ID="LitTitle" runat="server"></asp:Literal></div>
    <div class="tools_box">
	    <div class="tools_bar">
            <div class="search_box">
			    <asp:TextBox ID="txtKeywords" runat="server" CssClass="txtInput"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜 索" CssClass="btnSearch" onclick="btnSearch_Click" />
		    </div>
            <a href="bar_edit.aspx?action=<%=ActionEnum.Add %>&aid=<%=this.aid %>" class="tools_btn"><span><b class="add">添加广告</b></span></a>
		    <a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn"><span><b class="all">全选</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn"  
                OnClientClick="return ExePostBack('btnDelete');" onclick="btnDelete_Click"><span><b class="delete">批量删除</b></span></asp:LinkButton>
        </div>
    </div>

    <!--列表展示.开始-->
    <asp:Repeater ID="rptList" runat="server">
    <HeaderTemplate>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th align="left">广告名称</th>
        <th width="12%">开始时间</th>
        <th width="12%">到期时间</th>
        <th width="10%">链接</th>
        <th width="8%">状态</th>
        <th width="16%" align="left">发布时间</th>
        <th width="8%">操作</th>
      </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr>
        <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" /><asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" /></td>
        <td><a href="bar_edit.aspx?action=<%=ActionEnum.Edit %>&id=<%#Eval("id")%>"><%#Eval("title")%></a></td>
        <td align="center"><%#Convert.ToDateTime(Eval("start_time")).ToString("yyyy-MM-dd")%></td>
        <td align="center"><%#Convert.ToDateTime(Eval("end_time")).ToString("yyyy-MM-dd")%></td>
        <td align="center"><a target="_blank" href="<%#Eval("link_url") %>">广告链接</a></td>
        <td align="center"><%#GetState(Eval("is_lock").ToString(), Eval("start_time").ToString(), Eval("end_time").ToString())%></td>
        <td><%#string.Format("{0:g}",Eval("add_time"))%></td>
        <td align="center">
          <a href="bar_edit.aspx?action=<%=ActionEnum.Edit %>&id=<%#Eval("id")%>">编辑</a>
        </td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
      <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"8\">暂无记录</td></tr>" : ""%>
      </table>
    </FooterTemplate>
    </asp:Repeater>
    <!--列表展示.结束-->
    <div class="line10"></div>

</form>
</body>
</html>
