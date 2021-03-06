SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_manager]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[role_type] [int] NOT NULL CONSTRAINT [DF_dt_manager_role_type]  DEFAULT ((1)),
	[user_name] [nvarchar](100) NULL,
	[user_pwd] [nvarchar](100) NULL,
	[real_name] [nvarchar](50) NULL,
	[telephone] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[is_lock] [int] NOT NULL CONSTRAINT [DF_dt_manager_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_manager_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_dt_manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'role_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'role_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'user_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'user_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'user_pwd'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'user_pwd'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'real_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'real_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'telephone'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'telephone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'email'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_category]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_category_channel_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[parent_id] [int] NOT NULL CONSTRAINT [DF_dt_category_parent_id]  DEFAULT ((0)),
	[class_list] [nvarchar](500) NULL,
	[class_layer] [int] NOT NULL CONSTRAINT [DF_dt_category_class_layer]  DEFAULT ((0)),
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_category_sort_id]  DEFAULT ((99)),
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
 CONSTRAINT [PK_dt_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'parent_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'父类别ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'class_list'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'字类别ID列表(逗号分隔开)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'class_list'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'class_layer'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别深度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'class_layer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'link_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'URL跳转地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'link_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'img_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'img_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'seo_title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'seo_keywords'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_category', N'COLUMN',N'seo_description'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_category', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_download_attach]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_download_attach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[down_id] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[file_path] [nvarchar](255) NULL,
	[file_ext] [nvarchar](100) NULL,
	[file_size] [int] NOT NULL CONSTRAINT [DF_dt_download_attach_file_size]  DEFAULT ((0)),
	[down_num] [int] NOT NULL CONSTRAINT [DF_dt_download_attach_down_num]  DEFAULT ((0)),
 CONSTRAINT [PK_dt_download_attach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'down_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属下载ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'down_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'file_path'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'file_path'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'file_ext'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件扩展名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'file_ext'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'file_size'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'file_size'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download_attach', N'COLUMN',N'down_num'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download_attach', @level2type=N'COLUMN',@level2name=N'down_num'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_photo]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_channel_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[category_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_category_id]  DEFAULT ((0)),
	[photo_no] [nvarchar](100) NULL,
	[market_price] [decimal](18, 2) NOT NULL CONSTRAINT [DF_dt_photo_market_price]  DEFAULT ((0)),
	[sell_price] [decimal](18, 2) NOT NULL CONSTRAINT [DF_dt_photo_sell_price]  DEFAULT ((0)),
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_sort_id]  DEFAULT ((99)),
	[digg_good] [int] NOT NULL CONSTRAINT [DF_dt_photo_digg_good]  DEFAULT ((0)),
	[digg_act] [int] NOT NULL CONSTRAINT [DF_dt_photo_digg_act]  DEFAULT ((0)),
	[click] [int] NOT NULL CONSTRAINT [DF_dt_photo_click]  DEFAULT ((0)),
	[is_msg] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_msg]  DEFAULT ((0)),
	[is_top] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_top]  DEFAULT ((0)),
	[is_red] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_red]  DEFAULT ((0)),
	[is_hot] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_hot]  DEFAULT ((0)),
	[is_slide] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_slide]  DEFAULT ((0)),
	[is_lock] [tinyint] NOT NULL CONSTRAINT [DF_dt_photo_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_photo_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_dt_photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'category_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'category_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'photo_no'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'photo_no'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'market_price'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'市场价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'market_price'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'sell_price'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'sell_price'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'link_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'link_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'img_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'img_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'seo_title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'seo_keywords'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'seo_description'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'digg_good'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'顶一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'digg_good'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'digg_act'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'踩一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'digg_act'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'click'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'click'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_msg'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_top'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_top'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_red'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_red'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_hot'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_hot'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_slide'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否幻灯片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_slide'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否不显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_photo_album]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_photo_album](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_album_photo_id]  DEFAULT ((0)),
	[big_img] [nvarchar](255) NULL,
	[small_img] [nvarchar](255) NULL,
 CONSTRAINT [PK_dt_photo_album] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_album', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_album', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_album', N'COLUMN',N'photo_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属图文ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_album', @level2type=N'COLUMN',@level2name=N'photo_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_album', N'COLUMN',N'big_img'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'原图地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_album', @level2type=N'COLUMN',@level2name=N'big_img'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_album', N'COLUMN',N'small_img'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_album', @level2type=N'COLUMN',@level2name=N'small_img'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_photo_attribute_value]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_photo_attribute_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_attribute_value_photo_id]  DEFAULT ((0)),
	[attribute_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_attribute_value_attribute_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_dt_photo_attribute_value] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute_value', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute_value', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute_value', N'COLUMN',N'photo_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图文ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute_value', @level2type=N'COLUMN',@level2name=N'photo_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute_value', N'COLUMN',N'attribute_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'属性ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute_value', @level2type=N'COLUMN',@level2name=N'attribute_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute_value', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute_value', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute_value', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute_value', @level2type=N'COLUMN',@level2name=N'content'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_photo_attribute]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_photo_attribute](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_photo_attribute_channel_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[remark] [nvarchar](500) NULL,
	[type] [int] NOT NULL,
	[default_value] [nvarchar](500) NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_photo_attribute_sort_id]  DEFAULT ((99)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_photo_attribute_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_photo_attribute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'remark'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'remark'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'type'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示类型0输入框1下拉框2单选框3复选择' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'default_value'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'default_value'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_photo_attribute', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_photo_attribute', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_manager_log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_manager_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](100) NULL,
	[note] [nvarchar](255) NULL,
	[login_ip] [nvarchar](30) NULL,
	[login_time] [datetime] NOT NULL,
 CONSTRAINT [PK_dt_manager_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'user_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'user_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'action_type'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'action_type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'note'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'note'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'login_ip'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_log', N'COLUMN',N'login_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'login_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_contents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_contents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[category_id] [int] NOT NULL,
	[call_index] [nvarchar](50) NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_contents_sort_id]  DEFAULT ((99)),
	[click] [int] NOT NULL CONSTRAINT [DF_dt_contents_click]  DEFAULT ((0)),
	[digg_good] [int] NOT NULL CONSTRAINT [DF_dt_contents_digg_good]  DEFAULT ((0)),
	[digg_act] [int] NOT NULL CONSTRAINT [DF_dt_contents_digg_act]  DEFAULT ((0)),
	[is_msg] [tinyint] NOT NULL CONSTRAINT [DF_dt_contents_is_msg]  DEFAULT ((0)),
	[is_red] [tinyint] NOT NULL CONSTRAINT [DF_dt_contents_is_red]  DEFAULT ((0)),
	[is_lock] [tinyint] NOT NULL CONSTRAINT [DF_dt_contents_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_contents_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_dt_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'category_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'category_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'call_index'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调用标识' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'call_index'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'link_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'link_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'img_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'img_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'seo_title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'seo_keywords'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'seo_description'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'click'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'查看次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'click'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'digg_good'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'顶一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'digg_good'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'digg_act'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'踩一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'digg_act'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'is_msg'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'is_red'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'is_red'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否不显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_contents', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_contents', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_feedback]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[user_qq] [nvarchar](30) NULL,
	[user_email] [nvarchar](100) NULL,
	[add_time] [datetime] NOT NULL DEFAULT (getdate()),
	[reply_content] [ntext] NULL DEFAULT (''),
	[reply_time] [datetime] NULL,
	[is_lock] [tinyint] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_link]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[site_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[is_image] [int] NOT NULL DEFAULT ((0)),
	[sort_id] [int] NOT NULL DEFAULT ((99)),
	[is_red] [tinyint] NOT NULL DEFAULT ((0)),
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_sys_channel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_sys_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[sort_id] [int] NOT NULL,
 CONSTRAINT [PK_dt_sys_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_channel', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_channel', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_channel', N'COLUMN',N'model_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_channel', @level2type=N'COLUMN',@level2name=N'model_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_channel', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_channel', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_channel', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_channel', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_sys_model]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_sys_model](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_sys_model_sort_id]  DEFAULT ((0)),
	[table_name] [nvarchar](255) NULL CONSTRAINT [DF_dt_sys_model_table_name]  DEFAULT (''),
	[inherit_index] [nvarchar](255) NULL,
	[inherit_list] [nvarchar](255) NULL,
	[inherit_detail] [nvarchar](255) NULL,
	[is_sys] [tinyint] NOT NULL CONSTRAINT [DF_dt_sys_model_is_sys]  DEFAULT ((0)),
 CONSTRAINT [PK_dt_sys_model] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'inherit_index'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首页类名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'inherit_index'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'inherit_list'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表页类名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'inherit_list'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'inherit_detail'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细页类名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'inherit_detail'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model', N'COLUMN',N'is_sys'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统定义' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_comment]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_comment_channel_id]  DEFAULT ((0)),
	[content_id] [int] NOT NULL CONSTRAINT [DF_dt_comment_content_id]  DEFAULT ((0)),
	[title] [nvarchar](255) NULL,
	[user_id] [int] NOT NULL CONSTRAINT [DF_dt_comment_user_id]  DEFAULT ((0)),
	[user_name] [nvarchar](50) NULL,
	[user_ip] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[is_lock] [tinyint] NOT NULL CONSTRAINT [DF_dt_comment_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_comment_add_time]  DEFAULT (getdate()),
	[is_reply] [tinyint] NOT NULL CONSTRAINT [DF_dt_comment_is_reply]  DEFAULT ((0)),
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_dt_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'content_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'信息ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'content_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'user_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'user_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'user_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'user_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'user_ip'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发表时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'add_time'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'is_reply'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已答复' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'is_reply'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'reply_content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'答复内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'reply_content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_comment', N'COLUMN',N'reply_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'答复时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_comment', @level2type=N'COLUMN',@level2name=N'reply_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_article]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_article_channel_id]  DEFAULT ((0)),
	[category_id] [int] NOT NULL CONSTRAINT [DF_dt_article_category_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[author] [nvarchar](255) NULL,
	[form] [nvarchar](50) NULL,
	[zhaiyao] [nvarchar](255) NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_article_sort_id]  DEFAULT ((99)),
	[click] [int] NOT NULL CONSTRAINT [DF_dt_article_click]  DEFAULT ((0)),
	[digg_good] [int] NOT NULL CONSTRAINT [DF_dt_article_digg_good]  DEFAULT ((0)),
	[digg_act] [int] NOT NULL CONSTRAINT [DF_dt_article_digg_act]  DEFAULT ((0)),
	[is_msg] [int] NOT NULL CONSTRAINT [DF_dt_article_is_msg]  DEFAULT ((0)),
	[is_top] [int] NOT NULL CONSTRAINT [DF_dt_article_is_top]  DEFAULT ((0)),
	[is_red] [int] NOT NULL CONSTRAINT [DF_dt_article_is_red]  DEFAULT ((0)),
	[is_hot] [int] NOT NULL CONSTRAINT [DF_dt_article_is_hot]  DEFAULT ((0)),
	[is_slide] [int] NOT NULL CONSTRAINT [DF_dt_article_is_slide]  DEFAULT ((0)),
	[is_lock] [int] NOT NULL CONSTRAINT [DF_dt_article_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_article_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_dt_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'category_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'category_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'author'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'author'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'form'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'来源' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'form'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'zhaiyao'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'zhaiyao'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'link_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'link_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'img_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'img_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'seo_title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'seo_keywords'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'seo_description'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'click'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'查看次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'click'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'digg_good'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'顶一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'digg_good'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'digg_act'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'踩一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'digg_act'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_msg'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_top'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_top'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_red'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_red'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_hot'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_hot'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_slide'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否灯片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_slide'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_article', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_manager_role]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[role_type] [tinyint] NOT NULL,
 CONSTRAINT [PK_dt_manager_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role', N'COLUMN',N'role_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role', N'COLUMN',N'role_type'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_type'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_sys_model_nav]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_sys_model_nav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model_id] [int] NOT NULL CONSTRAINT [DF_dt_sys_model_nav_model_id]  DEFAULT ((0)),
	[title] [nvarchar](100) NULL,
	[nav_url] [nvarchar](255) NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_sys_model_nav_sort_id]  DEFAULT ((99)),
 CONSTRAINT [PK_dt_sys_model_nav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model_nav', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model_nav', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model_nav', N'COLUMN',N'model_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model_nav', @level2type=N'COLUMN',@level2name=N'model_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model_nav', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'导航标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model_nav', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model_nav', N'COLUMN',N'nav_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model_nav', @level2type=N'COLUMN',@level2name=N'nav_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_sys_model_nav', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sys_model_nav', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_manager_role_value]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_manager_role_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[channel_name] [nvarchar](255) NULL,
	[channel_id] [int] NOT NULL CONSTRAINT [DF_dt_manager_role_value_channel_id]  DEFAULT ((0)),
	[action_type] [nvarchar](100) NULL,
 CONSTRAINT [PK_dt_manager_role_value] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role_value', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role_value', N'COLUMN',N'role_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'role_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role_value', N'COLUMN',N'channel_name'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'channel_name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role_value', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_manager_role_value', N'COLUMN',N'action_type'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'action_type'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_download]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_download](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[category_id] [int] NOT NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NOT NULL CONSTRAINT [DF_dt_download_sort_id]  DEFAULT ((99)),
	[click] [int] NOT NULL CONSTRAINT [DF_dt_download_click]  DEFAULT ((0)),
	[digg_good] [int] NOT NULL CONSTRAINT [DF_dt_download_digg_good]  DEFAULT ((0)),
	[digg_act] [int] NOT NULL CONSTRAINT [DF_dt_download_digg_act]  DEFAULT ((0)),
	[is_msg] [tinyint] NOT NULL CONSTRAINT [DF_dt_download_is_msg]  DEFAULT ((0)),
	[is_red] [tinyint] NOT NULL CONSTRAINT [DF_dt_download_is_red]  DEFAULT ((0)),
	[is_lock] [tinyint] NOT NULL CONSTRAINT [DF_dt_download_is_lock]  DEFAULT ((0)),
	[add_time] [datetime] NOT NULL CONSTRAINT [DF_dt_download_add_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_dt_download] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'channel_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'category_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'category_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'link_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'link_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'img_url'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'img_url'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'seo_title'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'seo_keywords'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'seo_description'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'content'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'sort_id'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'click'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'查看次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'click'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'digg_good'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'顶一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'digg_good'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'digg_act'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'踩一下' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'digg_act'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'is_msg'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'is_red'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'is_red'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'is_lock'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否不显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'dt_download', N'COLUMN',N'add_time'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_download', @level2type=N'COLUMN',@level2name=N'add_time'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[view_search]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'create view [dbo].[view_search]
as
select id,channel_id,title,[content],add_time from dt_article union all
select id,channel_id,title,[content],add_time from dt_contents union all
select id,channel_id,title,[content],add_time from dt_download union all
select id,channel_id,title,[content],add_time from dt_photo' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[view_sys_channel]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[view_sys_channel]
AS
SELECT     dbo.dt_sys_model.title AS model_title, dbo.dt_sys_channel.id, dbo.dt_sys_channel.model_id, dbo.dt_sys_channel.title, dbo.dt_sys_channel.sort_id, 
                      dbo.dt_sys_channel.name
FROM         dbo.dt_sys_channel INNER JOIN
                      dbo.dt_sys_model ON dbo.dt_sys_channel.model_id = dbo.dt_sys_model.id
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'USER',N'dbo', N'VIEW',N'view_sys_channel', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dt_sys_channel"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 143
               Right = 169
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dt_sys_model"
            Begin Extent = 
               Top = 5
               Left = 229
               Bottom = 141
               Right = 358
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1635
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_channel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'USER',N'dbo', N'VIEW',N'view_sys_channel', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'USER',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_channel'

GO
INSERT INTO [dt_manager_role]
           ([role_name]
           ,[role_type])
     VALUES
           ('超级管理员',1)
GO
INSERT INTO [dt_manager]
           ([role_id]
           ,[role_type]
           ,[user_name]
           ,[user_pwd]
           ,[real_name]
           ,[telephone]
           ,[email])
     VALUES
           (1,1,'admin','8B0ED1C54416ADF8E6E0E3794AF0900D'
           ,'系统管理员','13800138000','info@it134.cn')
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (1,'内容管理','article/list.aspx',99)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (1,'栏目类别','category/list.aspx',100)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (2,'内容管理','photo/photo_list.aspx',99)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (2,'栏目类别','category/list.aspx',100)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (2,'扩展属性','photo/attribute_list.aspx',101)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (3,'内容管理','download/list.aspx',99)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (3,'栏目类别','category/list.aspx',100)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (4,'内容管理','content/list.aspx',99)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (4,'栏目类别','category/list.aspx',100)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (1,'评论管理','comment/list.aspx',101)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (2,'评论管理','comment/list.aspx',102)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (3,'评论管理','comment/list.aspx',101)
GO
INSERT INTO [dt_sys_model_nav]
           ([model_id]
           ,[title]
           ,[nav_url]
           ,[sort_id])
     VALUES
           (4,'评论管理','comment/list.aspx',101)
GO
INSERT INTO [dt_sys_model]
           ([title]
           ,[sort_id]
           ,[table_name]
           ,[inherit_index]
           ,[inherit_list]
           ,[inherit_detail]
           ,[is_sys])
     VALUES
           ('资讯模块',99,'article','DTcms.Web.UI.Page.article'
           ,'DTcms.Web.UI.Page.article_list','DTcms.Web.UI.Page.article_show',1)
GO
INSERT INTO [dt_sys_model]
           ([title]
           ,[sort_id]
           ,[table_name]
           ,[inherit_index]
           ,[inherit_list]
           ,[inherit_detail]
           ,[is_sys])
     VALUES
           ('图文模块',100,'photo','DTcms.Web.UI.Page.photo'
           ,'DTcms.Web.UI.Page.photo_list','DTcms.Web.UI.Page.photo_show',1)
GO
INSERT INTO [dt_sys_model]
           ([title]
           ,[sort_id]
           ,[table_name]
           ,[inherit_index]
           ,[inherit_list]
           ,[inherit_detail]
           ,[is_sys])
     VALUES
           ('下载模块',101,'download','DTcms.Web.UI.Page.download'
           ,'DTcms.Web.UI.Page.download_list','DTcms.Web.UI.Page.download_show',1)
GO
INSERT INTO [dt_sys_model]
           ([title]
           ,[sort_id]
           ,[table_name]
           ,[inherit_index]
           ,[inherit_list]
           ,[inherit_detail]
           ,[is_sys])
     VALUES
           ('内容模块',102,'contents','DTcms.Web.UI.Page.content'
           ,'DTcms.Web.UI.Page.content_list','DTcms.Web.UI.Page.content_show',1)
GO
INSERT INTO [dt_sys_channel]
           ([model_id]
           ,[name]
           ,[title]
           ,[sort_id])
     VALUES
           (1,'article','新闻资讯',1)
GO
INSERT INTO [dt_sys_channel]
           ([model_id]
           ,[name]
           ,[title]
           ,[sort_id])
     VALUES
           (2,'photo','图片分享',2)
GO
INSERT INTO [dt_sys_channel]
           ([model_id]
           ,[name]
           ,[title]
           ,[sort_id])
     VALUES
           (3,'down','资源下载',5)
GO
INSERT INTO [dt_sys_channel]
           ([model_id]
           ,[name]
           ,[title]
           ,[sort_id])
     VALUES
           (4,'content','公司介绍',4)
GO
INSERT INTO [dt_sys_channel]
           ([model_id]
           ,[name]
           ,[title]
           ,[sort_id])
     VALUES
           (2,'goods','商品展示',3)
GO