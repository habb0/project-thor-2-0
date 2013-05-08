IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_FavouriteRooms_FavouriteRooms]') AND type = 'F')
ALTER TABLE [dbo].[FavouriteRooms] DROP CONSTRAINT [FK_FavouriteRooms_FavouriteRooms]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GameConfig]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[GameConfig]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoleAccess]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RoleAccess]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Badges]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Badges]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Rooms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Rooms]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Furni]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Furni]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UserBans]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[UserBans]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FavouriteRooms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[FavouriteRooms]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Users]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomRights]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RoomRights]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomTypes]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RoomTypes]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MessengerBuddies]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[MessengerBuddies]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomCategories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RoomCategories]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CatalogueItems]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CatalogueItems]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Roles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Roles]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Vouchers]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Vouchers]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ModeratorLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ModeratorLog]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ChatLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ChatLog]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Logins]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Logins]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Referrals]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Referrals]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FurniDefinitions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[FurniDefinitions]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Gifts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Gifts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CataloguePages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CataloguePages]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExternalVars]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ExternalVars]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExternalTexts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ExternalTexts]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GameConfig]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GameConfig](
	[ConfigVersion] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseVersion] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoleAccess]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoleAccess](
	[RoleAccessID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RightName] [nvarchar](200) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Badges]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Badges](
	[BadgeID] [int] IDENTITY(1,1) NOT NULL,
	[BadgeName] [nvarchar](5) NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Rooms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1000,1) NOT NULL,
	[RoomName] [nvarchar](500) NOT NULL,
	[RoomDescription] [nvarchar](3000) NOT NULL CONSTRAINT [DF_Rooms_RoomDescription]  DEFAULT (N'none'),
	[RoomStatus] [nvarchar](20) NOT NULL CONSTRAINT [DF_Rooms_RoomStatus]  DEFAULT (N'open'),
	[RoomOwner] [int] NOT NULL CONSTRAINT [DF_Rooms_RoomOwner]  DEFAULT (0),
	[RoomType] [int] NOT NULL,
	[CategoryID] [int] NOT NULL CONSTRAINT [DF_Rooms_CategoryID]  DEFAULT (5),
	[Wallpaper] [int] NOT NULL CONSTRAINT [DF_Rooms_Wallpaper]  DEFAULT (201),
	[Floor] [int] NOT NULL CONSTRAINT [DF_Rooms_Floor]  DEFAULT (110),
	[SuperUsers] [int] NOT NULL CONSTRAINT [DF_Rooms_SuperUsers]  DEFAULT (0),
	[ShowOwner] [int] NOT NULL CONSTRAINT [DF_Rooms_ShowOwner]  DEFAULT (1),
	[Password] [nvarchar](50) NOT NULL CONSTRAINT [DF_Rooms_Password]  DEFAULT (N''),
	[MaxUsers] [int] NOT NULL CONSTRAINT [DF_Rooms_MaxUsers]  DEFAULT (25),
	[CurrentUsers] [int] NOT NULL CONSTRAINT [DF_Rooms_CurrentUsers]  DEFAULT (0),
	[RoomOrder] [int] NOT NULL CONSTRAINT [DF_Rooms_RoomOrder]  DEFAULT (0)
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Furni]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Furni](
	[FurniID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL CONSTRAINT [DF_Furni_RoomID]  DEFAULT (0),
	[FurniTypeID] [int] NOT NULL,
	[PosX] [int] NOT NULL CONSTRAINT [DF_Furni_PosX]  DEFAULT (0),
	[PosY] [int] NOT NULL CONSTRAINT [DF_Furni_PosY]  DEFAULT (0),
	[PosZ] [float] NOT NULL CONSTRAINT [DF_Furni_PosZ]  DEFAULT (0),
	[PosRotation] [int] NOT NULL CONSTRAINT [DF_Furni_PosRotation]  DEFAULT (0),
	[OwnerID] [int] NOT NULL CONSTRAINT [DF_Furni_OwnerID]  DEFAULT (0),
	[WallLocation] [nvarchar](100) NOT NULL CONSTRAINT [DF_Furni_WallLocation]  DEFAULT (N''),
	[FurniVar] [nvarchar](700) NOT NULL CONSTRAINT [DF_Furni_FurniVar]  DEFAULT (N''),
	[TeleportId] [int] NOT NULL CONSTRAINT [DF_Furni_TeleportId]  DEFAULT (0)
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UserBans]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserBans](
	[BanId] [int] IDENTITY(1,1) NOT NULL,
	[UserBanned] [int] NOT NULL,
	[UserBanner] [int] NOT NULL,
	[BanMessage] [nvarchar](500) NOT NULL,
	[BanExpires] [datetime] NOT NULL,
	[BanIP] [bit] NOT NULL CONSTRAINT [DF_UserBans_BanIP]  DEFAULT (0),
 CONSTRAINT [PK_UserBans] PRIMARY KEY CLUSTERED 
(
	[BanId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FavouriteRooms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FavouriteRooms](
	[FavouriteID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_FavouriteRooms] PRIMARY KEY CLUSTERED 
(
	[FavouriteID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[figure] [nvarchar](500) NOT NULL,
	[sex] [nvarchar](500) NOT NULL,
	[mission] [nvarchar](500) NOT NULL,
	[email] [nvarchar](500) NOT NULL,
	[dob] [nvarchar](500) NOT NULL,
	[credits] [int] NOT NULL,
	[tickets] [int] NOT NULL,
	[roleid] [int] NOT NULL,
	[poolfigure] [nvarchar](500) NOT NULL,
	[ClubDaysRemaining] [int] NOT NULL CONSTRAINT [DF_Users_ClubDaysRemaining]  DEFAULT (0),
	[ClubMonthsPassed] [int] NOT NULL CONSTRAINT [DF_Users_ClubMonthsPassed]  DEFAULT (0),
	[ClubMonthsRemaining] [int] NOT NULL CONSTRAINT [DF_Users_ClubMonthsRemaining]  DEFAULT (0),
	[ClubLastUpdate] [datetime] NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[CurrentBadge] [nvarchar](5) NOT NULL CONSTRAINT [DF_Users_CurrentBadge]  DEFAULT (N''),
	[LastIP] [nvarchar](100) NOT NULL CONSTRAINT [DF_Users_LastIP]  DEFAULT (N''),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomRights]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoomRights](
	[UserID] [int] NOT NULL,
	[RoomID] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomTypes]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoomTypes](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](200) NOT NULL,
	[RoomModel] [nvarchar](50) NOT NULL,
	[DefaultHeightmap] [varchar](8000) NOT NULL,
	[StartX] [int] NOT NULL,
	[StartY] [int] NOT NULL,
	[StartZ] [int] NOT NULL,
	[Guest] [bit] NOT NULL,
	[ReactorType] [nvarchar](100) NOT NULL,
	[CCTS] [nvarchar](500) NOT NULL CONSTRAINT [DF_RoomTypes_CCTS]  DEFAULT (0),
	[UserType] [int] NOT NULL CONSTRAINT [DF_RoomTypes_UserType]  DEFAULT (0),
	[MaxAscend] [float] NOT NULL CONSTRAINT [DF_RoomTypes_MaxAscend]  DEFAULT (1.5),
	[MaxDescend] [float] NOT NULL CONSTRAINT [DF_RoomTypes_MaxDescend]  DEFAULT (4)
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MessengerBuddies]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MessengerBuddies](
	[ConsoleID] [int] IDENTITY(1,1) NOT NULL,
	[User1] [int] NOT NULL,
	[User2] [int] NOT NULL,
	[Accepted] [bit] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RoomCategories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoomCategories](
	[RoomCategoryID] [int] NOT NULL,
	[RoomCategoryName] [nvarchar](100) NOT NULL,
	[RoomCategoryParent] [int] NOT NULL,
	[RoomCategoryType] [int] NOT NULL CONSTRAINT [DF_RoomCategories_RoomCategoryType]  DEFAULT (1),
	[CanTrade] [int] NOT NULL CONSTRAINT [DF_RoomCategories_CanTrade]  DEFAULT (0),
	[IsVisible] [bit] NOT NULL CONSTRAINT [DF_RoomCategories_IsVisible]  DEFAULT (1),
	[PlayerCategory] [bit] NOT NULL CONSTRAINT [DF_RoomCategories_PlayerCategory]  DEFAULT (0),
	[CategoryOrder] [int] NOT NULL CONSTRAINT [DF_RoomCategories_CategoryOrder]  DEFAULT (0),
	[SystemCategory] [bit] NOT NULL CONSTRAINT [DF_RoomCategories_SystemCategory]  DEFAULT (0),
 CONSTRAINT [PK_RoomCategories] PRIMARY KEY CLUSTERED 
(
	[RoomCategoryID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CatalogueItems]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CatalogueItems](
	[CatalogueItemID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogueFurniType] [int] NOT NULL,
	[CataloguePageID] [int] NOT NULL,
	[ItemCost] [int] NOT NULL,
	[PurchaseCode] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CatalogueItems] PRIMARY KEY CLUSTERED 
(
	[CatalogueItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Roles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[InheritRole] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Vouchers]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Vouchers](
	[VoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherCode] [nvarchar](50) NOT NULL,
	[VoucherAmount] [int] NOT NULL,
	[Redeemed] [bit] NOT NULL CONSTRAINT [DF_Vouchers_Redeemed]  DEFAULT (0),
	[RedeemedBy] [int] NOT NULL CONSTRAINT [DF_Vouchers_RedeemedBy]  DEFAULT (0),
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ModeratorLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ModeratorLog](
	[ModeratorLogID] [int] IDENTITY(1,1) NOT NULL,
	[Moderator] [int] NOT NULL,
	[Command] [nvarchar](50) NOT NULL,
	[Target] [int] NOT NULL,
	[Extra] [nvarchar](50) NOT NULL,
	[Info] [nvarchar](500) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ModeratorLog] PRIMARY KEY CLUSTERED 
(
	[ModeratorLogID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ChatLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ChatLog](
	[ChatLogID] [int] IDENTITY(1,1) NOT NULL,
	[Method] [nvarchar](30) NOT NULL,
	[Text] [nvarchar](185) NOT NULL,
	[Source] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[RoomID] [int] NOT NULL,
 CONSTRAINT [PK_ChatLog] PRIMARY KEY CLUSTERED 
(
	[ChatLogID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Logins]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Logins](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IPAddress] [nvarchar](100) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Referrals]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Referrals](
	[ReferID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Referred] [int] NOT NULL,
 CONSTRAINT [PK_Referrals] PRIMARY KEY CLUSTERED 
(
	[ReferID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FurniDefinitions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FurniDefinitions](
	[FurniDefinitionID] [int] IDENTITY(1,1) NOT NULL,
	[Sprite] [nvarchar](100) NOT NULL,
	[Flags] [nvarchar](20) NOT NULL CONSTRAINT [DF_FurniDefinitions_Flags]  DEFAULT (N''),
	[W] [int] NOT NULL CONSTRAINT [DF_FurniDefinitions_W]  DEFAULT (1),
	[L] [int] NOT NULL CONSTRAINT [DF_FurniDefinitions_L]  DEFAULT (0),
	[Col] [nvarchar](150) NOT NULL CONSTRAINT [DF_FurniDefinitions_Col]  DEFAULT (N'0'),
	[HeightOffset] [float] NOT NULL CONSTRAINT [DF_FurniDefinitions_HeightOffset]  DEFAULT (0),
	[HandType] [nvarchar](1) NOT NULL CONSTRAINT [DF_FurniDefinitions_Type]  DEFAULT (N'S'),
	[VarType] [int] NOT NULL CONSTRAINT [DF_FurniDefinitions_SignType]  DEFAULT (0),
	[ActionHeight] [float] NOT NULL CONSTRAINT [DF_FurniDefinitions_ActionHeight]  DEFAULT (0),
	[CanTrade] [bit] NOT NULL CONSTRAINT [DF_FurniDefinitions_CanTrade]  DEFAULT (1),
	[PublicFurni] [bit] NOT NULL CONSTRAINT [DF_FurniDefinitions_PublicFurni]  DEFAULT (0)
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Gifts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Gifts](
	[GiftID] [int] NOT NULL,
	[PurchaseCode] [nvarchar](300) NOT NULL,
	[Payload] [nvarchar](2000) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CataloguePages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CataloguePages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](100) NOT NULL,
	[PageVisibleName] [nvarchar](100) NOT NULL,
	[PageOrder] [int] NOT NULL,
	[PageLayout] [nvarchar](100) NOT NULL,
	[PageImageTitle] [nvarchar](100) NOT NULL CONSTRAINT [DF_CataloguePages_PageImageTitle]  DEFAULT (N''),
	[PageSideImage] [nvarchar](100) NOT NULL CONSTRAINT [DF_CataloguePages_PageSideImage]  DEFAULT (N''),
	[PageDescription] [nvarchar](3000) NOT NULL CONSTRAINT [DF_CataloguePages_PageDescription]  DEFAULT (N''),
	[PageLabel] [nvarchar](500) NOT NULL CONSTRAINT [DF_CataloguePages_PageLabel]  DEFAULT (N''),
	[PageAdditional] [nvarchar](4000) NOT NULL CONSTRAINT [DF_CataloguePages_PageAdditional]  DEFAULT (N''),
	[StaffOnly] [bit] NOT NULL CONSTRAINT [DF_CataloguePages_StaffOnly]  DEFAULT (0),
 CONSTRAINT [PK_CataloguePages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExternalVars]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExternalVars](
	[VarName] [nvarchar](500) NOT NULL,
	[VarValue] [nvarchar](4000) NOT NULL,
	[VarId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ExternalVars] PRIMARY KEY CLUSTERED 
(
	[VarId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExternalTexts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExternalTexts](
	[TextName] [nvarchar](500) NOT NULL,
	[TextValue] [nvarchar](4000) NOT NULL,
	[TextID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ExternalTexts] PRIMARY KEY CLUSTERED 
(
	[TextID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_FavouriteRooms_FavouriteRooms]') AND type = 'F')
ALTER TABLE [dbo].[FavouriteRooms]  WITH CHECK ADD  CONSTRAINT [FK_FavouriteRooms_FavouriteRooms] FOREIGN KEY([FavouriteID])
REFERENCES [dbo].[FavouriteRooms] ([FavouriteID])
GO
ALTER TABLE [dbo].[FavouriteRooms] CHECK CONSTRAINT [FK_FavouriteRooms_FavouriteRooms]
GO

-- Dumping data for table 'Badges'
--

-- Enable identity insert
SET IDENTITY_INSERT Badges ON
GO

INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(8, 'HC1', 2)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(9, 'XXX', 3)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(10, 'VIP', 4)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(11, 'SCR', 5)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(15, 'BUS', 5)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(16, 'NWB', 6)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(17, 'HBA', 7)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(18, 'ADM', 9)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(19, 'CNC', 10)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(20, 'PEN', 10)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(21, 'XXX', 6)
GO
INSERT INTO Badges (BadgeID, BadgeName, RoleID)
VALUES(22, 'VIP', 10)
GO

-- Disable identity insert
SET IDENTITY_INSERT Badges OFF
GO



-- Dumping data for table 'CatalogueItems'
--

-- Enable identity insert
SET IDENTITY_INSERT CatalogueItems ON
GO

INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(4, 4, 2, 10, 'purchase_poster_24')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(5, 1, 13, 25, 'purchase_spyro')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(6, 9, 3, 3, 'purchase_bed_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(7, 13, 12, 5, 'purchase_roller_aqua')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(8, 28, 6, 3, 'puchase_bed_silo_two')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(9, 29, 6, 3, 'purchase_bed_silo_one')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(10, 30, 6, 3, 'puchase_shelves_silo')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(11, 31, 6, 3, 'puchase_sofa_silo')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(12, 32, 6, 3, 'purchase_sofachair_silo')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(13, 33, 6, 1, 'puchase_table_silo_small')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(14, 34, 6, 6, 'puchase_divider_silo3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(15, 35, 6, 3, 'puchase_divider_silo2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(16, 36, 6, 3, 'purchase_divider_silo1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(17, 37, 6, 3, 'purchase_chair_silo')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(18, 38, 6, 3, 'purchase_barchair_silo')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(19, 39, 6, 3, 'purchase_table_silo_med')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(20, 40, 7, 3, 'purchase_chair_norja')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(21, 41, 7, 3, 'puchase_couch_norja')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(22, 42, 7, 3, 'purchase_table_norja_med')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(23, 43, 7, 3, 'purchase_shelves_norja')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(24, 44, 7, 3, 'purchase_soft_sofachair_norja')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(25, 45, 7, 4, 'purchase_soft_sofa_norja')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(26, 46, 7, 3, 'purchase_divider_nor2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(27, 47, 7, 3, 'purchase_divider_nor1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(28, 48, 7, 6, 'purchase_divider_nor3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(29, 49, 8, 3, 'purchase_sofachair_polyfon_girl')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(30, 50, 8, 4, 'purchase_sofa_polyfon_girl')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(31, 51, 8, 4, 'purchase_carpet_polar*1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(32, 52, 8, 4, 'purchase_bed_polyfon_girl_one')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(33, 53, 8, 3, 'purchase_bed_polyfon_girl')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(34, 54, 9, 3, 'purchase_bed_armas_two')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(35, 55, 9, 3, 'purchase_bed_armas_one')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(36, 56, 9, 4, 'purchase_fireplace_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(37, 57, 9, 3, 'purchase_bartable_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(38, 58, 9, 3, 'purchase_table_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(39, 59, 9, 3, 'purchase_bench_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(40, 60, 9, 6, 'purchase_divider_arm3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(41, 61, 9, 3, 'purchase_divider_arm1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(42, 62, 9, 3, 'purchase_divider_arm2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(43, 63, 9, 3, 'purchase_shelves_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(44, 64, 9, 3, 'purchase_bar_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(45, 65, 9, 1, 'purchase_bar_chair_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(46, 66, 9, 3, 'purchase_lamp_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(47, 67, 9, 3, 'purchase_lamp2_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(48, 68, 9, 2, 'purchase_small_table_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(49, 69, 9, 1, 'purchase_small_chair_armas')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(50, 215, 10, 3, 'purchase_bunny')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(51, 216, 10, 6, 'purchase_deluxtv')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(52, 217, 10, 4, 'purchase_woodtv')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(53, 219, 11, 3, 'special_teleporter_doorb')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(54, 220, 11, 4, 'special_teleporter_doorc')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(55, 16, 11, 5, 'special_teleporter_door')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(56, 22, 10, 3, 'A2 tlp 20')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(67, 218, 10, 3, 'purchase_red_tv')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(68, 222, 14, 1, 'purchase_doormat1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(69, 223, 2, 2, 'purchase_poster_Johnny')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(70, 224, 3, 1, 'purchase_z_shelf')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(71, 19, 19, 10, 'purchase_prize2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(72, 231, 19, 10, 'purchase_prize1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(73, 232, 19, 10, 'purchase_prize3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(74, 233, 13, 25, 'purchase_typingmachine')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(75, 17, 13, 25, 'purchase_throne')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(76, 234, 16, 4, 'purchase_giftflowers')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(77, 235, 16, 3, 'purchase_plant_fruittree')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(78, 236, 16, 3, 'purchase_plant_big_cactus')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(79, 237, 16, 3, 'purchase_plant_bonsai')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(80, 239, 16, 3, 'purchase_plant_pineapple')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(81, 238, 14, 3, 'purchase_rug_standard7')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(82, 240, 16, 3, 'purchase_plant_yukka')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(83, 241, 16, 3, 'purchase_plant_sunflower')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(84, 242, 16, 3, 'purchase_plant_rose')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(85, 243, 16, 3, 'purchase_plant_small_cactus')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(86, 244, 14, 3, 'purchase_rug_standard1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(87, 245, 14, 3, 'purchase_rug_standard6')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(88, 246, 14, 3, 'purchase_carpet_soft')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(89, 247, 14, 3, 'purchase_carpet_soft3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(90, 248, 14, 3, 'purchase_carpet_soft4')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(91, 250, 10, 3, 'purchase_bottle')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(92, 6, 3, 3, 'purchase_mode_bar')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(93, 251, 13, 25, 'purchase_hologram')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(94, 253, 13, 25, 'purchase_redhologram')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(95, 5, 3, 3, 'purchase_bar_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(96, 8, 3, 3, 'purchase_sofa_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(97, 10, 3, 3, 'purchase_bed_polyfon_one')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(98, 3, 3, 3, 'purchase_sofachair_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(99, 11, 3, 6, 'purchase_divider_poly3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(100, 2, 3, 3, 'purchase_bardeskcorner_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(101, 254, 3, 3, 'purchase_chair_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(102, 255, 3, 4, 'purchase_table_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(103, 256, 3, 4, 'purchase_smooth_table_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(104, 257, 3, 3, 'purchase_table_polyfon_med')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(105, 258, 3, 2, 'purchase_table_polyfon_small')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(106, 259, 3, 4, 'purchase_shelves_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(107, 260, 3, 5, 'purchase_fireplace_polyfon')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(108, 15, 10, 6, 'purchase_edice')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(109, 261, 2, 4, 'purchase_best_flag')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(110, 265, 13, 25, 'purchase_petalpatch')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(111, 349, 19, 10, 'purchase_carpet_polar*3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(112, 305, 19, 15, 'purchase_rare_beehive_bulb*1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(113, 306, 19, 15, 'purchase_hc_tbl')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(114, 310, 13, 25, 'purchase_mocchamaster')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(115, 314, 19, 4, 'purchase_menorah')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(116, 315, 19, 10, 'purchase_samovar')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(117, 319, 19, 10, 'purchase_rare_stand')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(118, 320, 19, 10, 'purchase_hcamme')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(119, 307, 19, 10, 'hc_dsk')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(120, 308, 13, 25, 'purchase_hc_chr')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(121, 311, 19, 8, 'purchase_edicehc')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(122, 313, 19, 5, 'special_teleporter_doorD')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(123, 318, 19, 20, 'purchase_poster')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(124, 321, 19, 5, 'purchase_rare_parasol*3')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(125, 322, 19, 5, 'purchase_rare_fountain*2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(126, 325, 13, 25, 'purchase_club_sofa')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(127, 327, 19, 5, 'purchase_hc_lmp')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(128, 308, 19, 4, 'purchase_hc_chr')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(129, 309, 19, 5, 'purchase_skullcandle')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(130, 311, 19, 6, 'purchase_edicehc')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(131, 323, 19, 2, 'purchase_rare_elephant_statue*1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(132, 324, 19, 2, 'purchase_rare_elephant_statue*2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(133, 333, 19, 4, 'purchase_rare_fountain*1')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(134, 335, 19, 5, 'rare_fountain')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(135, 337, 19, 12, 'purchase_poster')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(136, 343, 19, 1, 'purchase_poster_29')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(137, 344, 19, 1, 'purchase_poster_46')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(138, 345, 19, 1, 'purchase_poster_48')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(139, 348, 19, 10, 'purchase_carpet_polar*2')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(140, 350, 19, 10, 'purchase_carpet_polar*4')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(141, 351, 19, 10, 'purchase_djesko_turntable')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(142, 352, 20, 3, 'purchase_shelves_basic')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(143, 353, 20, 4, 'purchase_bar_basic')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(144, 354, 20, 6, 'purchase_fridge')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(145, 355, 20, 3, 'purchase_lamp_basic')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(146, 356, 13, 10, 'purchase_heartsofa')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(147, 357, 19, 10, 'purchase_valentinescreen')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(148, 358, 19, 10, 'purchase_joulutahti')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(149, 359, 19, 10, 'purchase_plant_cruddy')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(150, 360, 10, 1, 'purchase_duck')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(151, 361, 19, 5, 'purchase_statue')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(152, 362, 19, 5, 'purchase_poster_47')
GO
INSERT INTO CatalogueItems (CatalogueItemID, CatalogueFurniType, CataloguePageID, ItemCost, PurchaseCode)
VALUES(153, 363, 19, 5, 'purchase_poster_49')
GO

-- Disable identity insert
SET IDENTITY_INSERT CatalogueItems OFF
GO



-- Dumping data for table 'CataloguePages'
--

-- Enable identity insert
SET IDENTITY_INSERT CataloguePages ON
GO

INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(2, 'cat_posters', 'Poster', 10, 'ctlg_layout2', 'catalog_gallery_headline1', 'catalog_posters_teaser1', 'Adorn your walls with wondrous works of art, posters, plaques and wall hangings. We have items to suit all tastes, from kitsch to cool, traditional to modern.', 'Click on the item you want for more information.', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(3, 'cat_mode', 'Mode', 8, 'ctlg_layout2', 'catalog_mode_headline1', 'catalog_mode_teaser1', 'Introducing the Mode Collection...  Steely grey functionality combined with sleek designer upholstery. The Habbo that chooses this furniture is a cool urban cat - streetwise, sassy and so slightly untouchable.', ' Introducing the Mode Collection... Steely grey functionality combined with sleek designer upholstery. The Habbo that chooses this furniture is a cool urban cat - streetwise, sassy and so slightly untouchable.', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(4, 'cat_spaces', 'Spaces', 3, 'ctlg_spaces', 'catalog_spaces_headline1', ' ', 'Are your walls looking a little grey?  What you need is a splash of paint and this is the place to get it!  <br><br>A splash of colour on the walls and a nice carpet can make all the difference. Use our virtual room below to test out the combinations befo', ' ', 't1:Wall|t2:Floor|t3:Pattern|t4:Colour|t5:Pattern|t6:Colour|t7:Preview|p:Wallpaper	Wallpaper	2		i	special_wallpaper			special_wallpaper|p:Floor	Floor	2		i	special_floor			special_floor', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(5, 'cat_frontpage', 'Front Page', 1, 'ctlg_frontpage2', 'catal_fp_header', 'catal_fp_pic4,catal_fp_pic5', ' ', 'Need some Furni for your Habbo room?  Well, you\\\''re in the right place!  This Catalogue is packed FULL of funky Furni, just click the tabs on the right to browse.<br><br>We regularly add and remove Furni, so check back regularly for new items.<br><br> ', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(6, 'cat_area', 'Area', 4, 'ctlg_layout2', 'catalog_area_headline1', 'catalog_area_teaser1', ' ', ' Introducing the Area Collection...  Clean, chunky lines set this collection apart as a preserve of the down-to-earth Habbo. It\''s beautiful in its simplicity, and welcoming to everyone. ', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(7, 'cat_iced', 'Iced', 5, 'ctlg_layout2', 'catalog_iced_headline1', 'catalog_iced_teaser1', 'Introducing the Iced Collection...  For the Habbo who needs no introduction. It\\\\\\\''s so chic, it says everything and nothing. It\\\\\\\''s a blank canvas, let your imagination to run wild! ', 'Introducing the Iced Collection... For the Habbo who needs no introduction. It\\\\\\\''s so chic, it says everything and nothing. It\\\\\\\''s a blank canvas, let your imagination to run wild!', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(8, 'cat_candy', 'Candy', 6, 'ctlg_layout2', 'catalog_candy_headline1 ', 'catalog_candy_teaser1', ' ', 'Get off my chair fool!', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(9, 'cat_lodge', 'Lodge', 7, 'ctlg_layout2', 'catalog_lodge_headline1', 'catalog_lodge_teaser1', ' ', 'Introducing the Lodge Collection...  Do you appreciate the beauty of wood?  For that ski lodge effect, or to match that open fire... Lodge is the Furni of choice for Habbos with that no frills approach to decorating. ', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(10, 'cat_Accessories', 'Accessories', 11, 'ctlg_layout2', 'catalog_extra_headline1', 'catalog_extra_teaser1,', ' I love my rabbit...', 'Is your room missing something?  Well, now you can add the finishing touches that express your true personality. And don\''t forget, like everything else, these accessories can be moved about to suit your mood.', 's:2: I love my rabbit...|', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(11, 'cat_Teles', 'Teleports', 12, 'ctlg_layout2', 'catalog_doors_headline1', 'catalog_teleports_teaser2,catalog_door_c,catalog_door_b,', 'Beam your Habbo from one room to another with one of our cunningly disguised, space age teleports. Now you can link any two rooms together! Teleports are sold in pairs, so if you trade for them, check you\''re getting a linked pair.', 'Select an item by clicking one of the icons on the left.', 's:New Door Teleport!', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(12, 'cat_rollers', 'Rollers', 13, 'ctlg_layout2', 'catalog_roller_headline1', ' ', 'You can fit 35 Rollers in a Guest Room!', 'Click on a Roller to see more information!', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(13, 'cat_playerrares', 'Rares', 2, 'ctlg_layout2', 'catalog_rares_headline1', 'catalog_hc_teaser', 'The Shiny Rares!', 'The Shiny Rares!', ' ', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(14, 'cat_Rugs', 'Rugs', 14, 'ctlg_layout2', 'catalog_rugs_headline1', 'catalog_rugs_teaser1,', 'We have rugs for all occasions.  All rugs are non-slip and washable.', 'Click on the item you want for more information.', 's:2: Rugs, rugs and more rugs!', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(15, 'cat_trophys', 'Trophys', 998, 'ctlg_trophies', 'catalog_trophies_headline1', ' ', 'Reward your Habbo friends, or yourself with one of our fabulous glittering array of bronze, silver and gold trophies.<br><br>First choose the trophy model (click on the arrows to see all the different styles) and then the metal (click on the seal below th', ' ', 't1:Type your inscription CAREFULLY, it\''s permanent!', 1)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(16, 'cat_plants', 'Plants', 15, 'ctlg_layout2', 'catalog_plants_headline1', 'catalog_plants_teaser1', 'Introducing the Plant Collection...  Every room needs a plant! Not only do they bring a bit of the outside inside, they also enhance the air quality!', 'Click on the item you want for more information.', 's:2: Be at one with trees!', 0)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(19, 'cat_staffrares', 'Staff Hidden', 999, 'ctlg_layout2', 'catalog_rares_headline1', 'catalog_hc_teaser', 'Staff Rares Page', 'Staff Rares', ' ', 1)
GO
INSERT INTO CataloguePages (PageID, PageName, PageVisibleName, PageOrder, PageLayout, PageImageTitle, PageSideImage, PageDescription, PageLabel, PageAdditional, StaffOnly)
VALUES(20, 'cat_pura', 'Pura', 9, 'ctlg_layout2', 'catalog_pura_headline1', ' ', 'Introducing the Pura Collection...  This collection breathes fresh, clean air and cool tranquility.', ' ', ' ', 0)
GO

-- Disable identity insert
SET IDENTITY_INSERT CataloguePages OFF
GO


-- Dumping data for table 'ExternalTexts'
--

-- Enable identity insert
SET IDENTITY_INSERT ExternalTexts ON
GO

INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_009', 'Hound of Hull', 3795)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu_ui5', 'Balance', 3796)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_008', 'Springy Spaniel', 3797)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu_ui4', 'Stabilise', 3798)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_007', 'Slobber Don', 3799)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu_ui3', 'Moving', 3800)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*9_desc', 'Red Area Occasional Table', 3801)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YouMustAgree', 'You must accept the Terms and Conditions before proceeding.', 3802)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_006', 'Stripy Setter', 3803)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu_ui2', 'Push', 3804)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_005', 'Paws Forethought', 3805)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu_ui1', 'Balance', 3806)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*2_desc', 'Black Iced bar desk', 3807)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_004', 'Droopy of Pawford', 3808)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_003', 'Rescue Bernard', 3809)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_002', 'Joe Cocker Spaniel', 3810)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_001', 'Husky', 3811)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_000', 'Yappy Yorkie', 3812)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2003_desc', 'Would you trust this man?', 3813)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*5_desc', 'Pink Area Armchair', 3814)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_silo_desc', 'For nic naks and art deco books', 3815)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorD_name', 'Imperial Teleport', 3816)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*2_desc', 'Hip plastic furniture', 3817)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_46_desc', 'Twinkle, twinkle', 3818)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*3_desc', 'Two can perch comfortably', 3819)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fireplace_polyfon_name', 'Fireplace', 3820)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_change', 'Choose cards to change', 3821)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*8_desc', 'Yellow Ice corner', 3822)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*5_name', 'Square Dining Table', 3823)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*9_name', 'Round Dining Table', 3824)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja_desc', 'For nic naks and art deco books', 3825)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pick_furniture', 'Put Furni In Hand', 3826)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*3_desc', 'White Mode Single Bed', 3827)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_17/0_desc', ' ', 3828)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*4_name', 'Beige Mode Sofa', 3829)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_renew2', 'You are Thor Club member. If you want to change your subscription or leave the club, use the link below.', 3830)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_renew1', 'Your Thor Club membership will be active for another %days% days. You can extend your membership by paying with Credits.', 3831)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen2_name', 'Gift', 3832)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*2_desc', 'Black Iced Sofa', 3833)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_moreoptions', 'More Options >>', 3834)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_habbo.bottombar.text.notmember', 'Thor Club', 3835)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_valentinescreen_desc', 'Peep through and smile!', 3836)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood1_name', 'Doggy Bones', 3837)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja_name', 'White Solarium', 3838)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('navigator.no_category', 'No Category', 3839)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*8_name', 'Yellow Iced Angle', 3840)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*0_name', 'White Lace Pillow', 3841)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_rooms_search', 'Search', 3842)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*9_name', 'Red Iced Sofa', 3843)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1004_name', 'Eid Mubarak Poster', 3844)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*6_desc', 'Rejuvenate your pixels!', 3845)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_31_desc', 'Pure and unbridled nu-metal', 3846)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*4_name', 'Rubber Ball', 3847)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*3_name', 'White Mode Bardesk Corner', 3848)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('forgottenpw_done', 'If the email you gave during registration was correct, your password will be sent to you now.', 3849)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_md_limukaappi_name', 'Cola Machine', 3850)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*7_desc', 'Ultimate coziness', 3851)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie2_desc', 'For gourmet kittens', 3852)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_cant_set_item', 'You cannot place this in someone else''s room!', 3853)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*2_desc', 'For nic naks and art deco books', 3854)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_9/0_desc', ' ', 3855)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Club Mammoth and The Blue Dragon Tavern, and a 500 limit on your friends list!', ' ', 3856)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_welcome', 'Welcome', 3857)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_select_all', 'Select All Friends', 3858)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*9_name', 'Red Bookcase', 3859)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*5_desc', 'Translucent beauty', 3860)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa_desc', 'Translucent beauty', 3861)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_orient/0_desc', 'Tres chic with an Eastern twist. For Thor Club members only.', 3862)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*2_desc', 'Energy beams. No trespassers!', 3863)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*2_name', 'Black Safe Minibar', 3864)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*3_name', 'White Bar Stool', 3865)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_corner_china_desc', 'Firm, fireproof foundation', 3866)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*7_desc', 'Green Mode Double Bed', 3867)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_hc_info_url', 'http://%predefined%//club/index.html', 3868)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*5_name', 'Large Coffee Table Pink', 3869)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*3_desc', 'Virtual blackcurrant rocks!', 3870)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_56_desc', 'Serious partying going on!', 3871)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*9_name', 'Violet Sci-Fi Port', 3872)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_4_name', 'Snow Rookies Lobby', 3873)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_door_name', 'Telephone Box', 3874)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_tooLongPW', 'Your password is too long. Your password must contain 6-9 characters and have at least one number.', 3875)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*a_desc', 'Available in a variety of colours', 3876)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fridge_desc', 'Keep cool with a chilled snack or drink', 3877)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_won', 'WON!', 3878)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_12/0_desc', ' ', 3879)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*3_desc', 'Breathtaking bronze', 3880)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('char_welcome', 'Welcome!', 3881)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_3/0_desc', ' ', 3882)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_cancel', 'Cancel', 3883)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hologram_name', 'Holopod', 3884)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*2_name', 'Jade Dragon Lamp', 3885)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_camera_name', 'Camera', 3886)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*4_name', 'Beige Area Corner Shelf', 3887)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_tv_studio_name', 'MuchMusic HQ', 3888)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_8_desc', 'Players come in all colours', 3889)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_doorbell', 'Rings the doorbell - Open the door?', 3890)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_not_now', 'Cancel', 3891)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*8_name', 'Yellow Area Gate', 3892)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*4_desc', 'Beige Area Coffee Table', 3893)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*3_desc', 'Soft and tearproof!', 3894)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_pickup', 'Pick Up', 3895)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*5_name', 'Floor Rug', 3896)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_post.it_name', 'Pad of stickies', 3897)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_red_desc', 'In a choice of colours', 3898)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*1_name', 'Classic Traffic Light', 3899)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_beginner_name', 'Playing beginner game', 3900)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_info_film', 'Films For Camera', 3901)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_turkey_name', 'Roast Turkey', 3902)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*3_desc', 'Translucent beauty', 3903)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*4_desc', 'Add an exotic touch to your room', 3904)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_banner_text', ' ', 3905)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_continue_button', 'Buy one month', 3906)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_cn_sofa_name', 'Chinese Lacquer Sofa', 3907)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*2_desc', 'Silver trophy', 3908)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_keys_dive', 'Diving moves:', 3909)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_desc_3_period', '6 Months (186 days) ', 3910)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_src_hd', 'Search Results.', 3911)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*3_name', 'Chair', 3912)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('int_update_id', 'Update My Information >>', 3913)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*2_desc', 'Roll out!', 3914)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*5_name', 'Pink Iced bar desk', 3915)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*4_name', 'Beige Mode Bardesk Gate', 3916)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*2_name', 'Black Area Sofa', 3917)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_promise', '*Any personal information you supply will only be used by Sulake UK Ltd in accordance with our Privacy Policy and will not be shared with third parties.', 3918)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one_desc', 'Cot of the artistic', 3919)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hcsohva_desc', 'For royal bottoms...', 3920)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck3_desc', 'With added egtoplasm', 3921)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_isp_change', 'Change your subscription', 3922)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_spyro_desc', 'The stuff of legend', 3923)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_birdie_name', 'Pop-up Egg', 3924)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*9_name', 'Red Iced Auto Shutter', 3925)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_report_header', 'Report Abusive Message', 3926)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('opening_hours_text_shutdown', 'The game will shut down in %d% minutes. To avoid confusion, purchasing of furniture, Thor Club and game tickets will be disabled during that time, as well as playing Games and furniture trading. Thank you for visiting and welcome back tomorrow!', 3927)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_silo_studydesk_name', 'For the true Scholars', 3928)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*3_name', 'Glass sofa', 3929)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*9_desc', 'Hip plastic furniture', 3930)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('callhelp_sent', 'Your Call For Help Has Been Sent.', 3931)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*6_name', 'Blue Silo Dining Chair', 3932)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*10_name', 'Plastic Pod Chair', 3933)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_skullcandle_name', 'Skull Candle Holder', 3934)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*4_desc', 'Snuggle up on a Funky bear rug...', 3935)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*8_desc', 'Yellow Mode Sofa', 3936)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus_pwagain', 'pw again:', 3937)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen6_desc', 'What''s inside?', 3938)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_0_name', 'Free Game Lobby', 3939)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*3_name', 'blue pillar', 3940)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_china_name', 'Chinese Lacquer Chair', 3941)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*7_desc', 'Green Mode Bardesk', 3942)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_pineapple_desc', 'Needs loving glances', 3943)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*4_desc', 'Puffy, soft and huge', 3944)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_moonrug_name', 'Moon Rug', 3945)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_thanks_text', 'Here you can see your Thor Club membership status, number of elapsed months, pre-ordered months and status of the ongoing month.', 3946)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_3min', '3min', 3947)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_523_name', 'The flag of India', 3948)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_5/0_desc', ' ', 3949)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*3_desc', 'Hip plastic furniture', 3950)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('back', 'Back', 3951)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('is_moderator', '(Moderator)', 3952)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*7_desc', 'Green Mode Bardesk Corner', 3953)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_button_close', 'Close Window', 3954)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*7_name', 'Purple Marquee', 3955)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_furni_success', 'Voucher was successfully redeemed. You have been given the following furniture:', 3956)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue_name', 'Golden Elephant', 3957)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*3_name', 'Yellow Water Bowl', 3958)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_34_name', 'Scamme''d', 3959)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*1_desc', 'Hip plastic furniture', 3960)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bunny_name', 'Squidgy Bunny', 3961)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*8_name', 'Occasional Table', 3962)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_14/0_desc', ' ', 3963)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*5_name', 'White Spaceship Door', 3964)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*1_name', 'Sport corner tartan', 3965)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_desc', 'Yes, take a load of snowballs and hit the enemy Teams. Easy, isn''t it?', 3966)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('password.email.prefix', 'Your password is:', 3967)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva_name', 'Club Massiva', 3968)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*2_desc', 'Hip plastic furniture', 3969)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*6_desc', 'Totally shatter-proof!', 3970)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*7_desc', 'Practical and convenient', 3971)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3_name', 'Door (Lockable)', 3972)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*9_desc', 'For larger gatherings', 3973)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_myinterests', 'My interests:', 3974)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('rotate', 'Rotate', 3975)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('emailpw', 'Send', 3976)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop_rumble_name', 'Rooftop Rumble', 3977)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buy', 'Buy', 3978)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*9_name', 'Plastic Pod Chair', 3979)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*4_desc', 'Fanning the fires of SUPERLOVE...', 3980)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_locked', 'Door locked - visitors have to ring doorbell', 3981)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_happy', 'Happiness:', 3982)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*7_name', 'Green Area Occasional Table', 3983)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_youagree', 'You Agree', 3984)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2001_name', 'SeinNightitititititdiskotappaja', 3985)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*3_name', 'White Area Armchair', 3986)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_info', 'Because of your age, we need to let your parents know you are registering at Thor. Please give the email address of one of your parents/guardians.', 3987)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_5_name', 'Tournament Lobby', 3988)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*6_desc', 'Scary and scorching!', 3989)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_tv_studio/0_desc', 'Come back stage at Popworld in their TV Studio!', 3990)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('next_onearrowed', 'Next >', 3991)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*8_desc', 'Yellow Area Corner Shelf', 3992)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*3_desc', 'Breathtaking bronze', 3993)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance_choose', 'Choose Dance', 3994)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*12_desc', 'Tuck it away', 3995)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_djesko_turntable_name', 'Turntable', 3996)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_44_name', 'Mummy', 3997)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_nameoftheroom', 'Name Of The Room', 3998)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_xmasduck_desc', 'A right Christmas quacker!', 3999)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_youoffer', 'You Offer:', 4000)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*9_desc', 'Available in a variety of colours', 4001)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*3_desc', 'White Iced gate', 4002)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*6_name', 'Blue Ice corner', 4003)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*14_name', 'Occasional Table', 4004)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*5_desc', 'Chill and wait your turn!', 4005)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_old_skool_name', 'Old Skool', 4006)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*2_desc', 'Black Mode Bardesk', 4007)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_createyrown', 'Create Your Own Room', 4008)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sink_desc', 'Hot and cold thrown in for no charge', 4009)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*10_name', 'Occasional Table', 4010)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain_desc', 'For our feathered friends', 4011)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_netcafe/0_desc', ' ', 4012)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*7_desc', 'Hip plastic furniture', 4013)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('more_roomlayouts', 'Extra room layouts for Thor Club members >>', 4014)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('BuddyPrivateRoom', 'An A Guest Room', 4015)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*9_desc', 'Red Iced  bar desk', 4016)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*8_desc', 'Yellow Mode Bardesk Gate', 4017)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*6_desc', 'Blue Area Sofa', 4018)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*2_desc', 'Sleek and chic for each cheek', 4019)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_502_desc', 'The US flag', 4020)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_6/0_desc', ' ', 4021)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue*2_desc', 'Say hello to Nelly', 4022)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*8_name', 'Yellow Mode Armchair', 4023)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*5_name', 'Graphite Sleeping Bag', 4024)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*13_desc', 'Hip plastic furniture', 4025)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*9_name', 'Red Chair', 4026)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_509_name', 'The Jamaican flag', 4027)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_13_desc', 'skyscrapers in arty black and white', 4028)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wood_tv_desc', 'For family viewing', 4029)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*7_desc', 'Translucent beauty', 4030)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp2_armas_name', 'Lodge candle', 4031)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_roomdesc', 'Room description:', 4032)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_how2', 'It''s quite simple - just fill out the form below and Splash Plastic will send you a card through the post.', 4033)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_how1', 'How to get your card?', 4034)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_boy', 'Boy', 4035)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*3_name', 'Glass stool', 4036)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1_name', 'Rubber Ball', 4037)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*7_desc', 'Recovered from Habblantis', 4038)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_WrongNameOrPassword', 'Wrong name or password - please try again!', 4039)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*0_name', 'Red Laser Door', 4040)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_note_text', 'Never change your password or email\rif someone else asks you to - they will\rsteal your furni and Credits!', 4041)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*3_desc', 'No trespassing, please!', 4042)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_typeurname', 'Type your greetings here\r(don''t forget to put your name!):', 4043)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*1_name', 'Blue Ice Cream Maker', 4044)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_54_name', 'Hockey Stick', 4045)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_0_name', 'Tournament', 4046)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*2_desc', 'High technology in a retro frame', 4047)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_check_confirm', 'Please check that your information is correct, especially your birthdate and name. You CANNOT change these later. If you want make any changes now, press the back button.', 4048)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*2_name', 'Sport track straight asphalt', 4049)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.e2.info', 'There are %e2% Players in front of you in the queue.', 4050)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_txt', 'Tickets can be used for the Battle Ball, Lido diving and Wobble Squabble games. Tickets never expire.\r\rCurrently you have \x1 ticket(s).', 4051)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*14_desc', 'Hip plastic furniture', 4052)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_year', 'Year', 4053)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_7/0_desc', ' ', 4054)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*14_desc', 'Hip plastic furniture', 4055)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*9_name', 'Violet Smoke Machine', 4056)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_6', 'Stuffed', 4057)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_38_desc', 'For really TOUGH Players!', 4058)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_5', 'Full', 4059)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_4', 'Satisfied', 4060)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_selectproduct', 'Select product:', 4061)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_3', 'Peckish', 4062)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_2', 'Rumbling', 4063)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_1', 'Hungry', 4064)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_general_prepaid', 'Prepaid Months', 4065)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hung_0', 'Empty', 4066)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon_girl_desc', 'Romantic pink for two', 4067)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('boy', 'Boy', 4068)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_reply_cfh', 'Reply to:', 4069)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*1_name', 'Fish trophy', 4070)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_credits', 'Credits', 4071)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_name', 'Double Bed', 4072)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_link_tournament_highScores_url', 'http://www.habbohotel.co.uk/games/battleball', 4073)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_createroom_hd', 'Here you can create your own room!', 4074)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*9_desc', 'There out of this world!', 4075)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool_name', 'Glass stool', 4076)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_512_desc', 'The flag of Ireland', 4077)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_link_url2', 'http://%predefined%//footer_pages/privacy_policy.html', 4078)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_armas_desc', 'It''s a barrel of laughs and a great talking point', 4079)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_6_name', 'Abstract Poster', 4080)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_link_url1', 'http://%predefined%//help/parents_guide.html', 4081)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hotel_kitchen/0_desc', 'Meet the Assistant Chef - Russ', 4082)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_16/0_desc', ' ', 4083)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*4_desc', 'Translucent beauty', 4084)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_itsurs', 'Yay! It''s being delivered now..', 4085)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*2_name', 'Black Area Coffee Table', 4086)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_23_desc', 'The jolly fat man himself', 4087)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*1_name', 'Blue Inflatable Chair', 4088)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*9_name', 'Red Safe Minibar', 4089)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*3_desc', 'The power of movement', 4090)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('mura-1234', 'The Man', 4091)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sport_name', 'Power Gym', 4092)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/5_name', 'Poker', 4093)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_expert_name', 'Playing expert game', 4094)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pizza_desc', 'You dirty player', 4095)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*2_name', 'RosewoodScreen', 4096)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_firstTimeHere', 'First time here?', 4097)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_polyfon_name', 'Mini-Bar', 4098)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2005_desc', 'The Special Infobus Poster', 4099)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*7_desc', 'Green Area Armchair', 4100)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_extrainfo', 'Extra Info:', 4101)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon_desc', 'Perfect for work or play', 4102)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_6/0_desc', ' ', 4103)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*4_desc', 'Hip plastic furniture', 4104)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto_name', 'Chair', 4105)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_48_desc', 'All that glitters...', 4106)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_openbutton', 'Open', 4107)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*5_desc', 'Two can perch comfortably', 4108)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ForgotSetPassword', 'Please check your password', 4109)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_title', 'Safe Trading', 4110)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*7_name', 'Square Dining Table', 4111)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_keys_jump', 'Jump:', 4112)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_drinks_desc', 'Are you a slob too?', 4113)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('done', 'Done', 4114)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*2_desc', 'Available in a variety of colours', 4115)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*2_name', 'Blue Bear Rug', 4116)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_confirmDelete', 'Confirm', 4117)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*6_name', 'Blue Mode Sofa', 4118)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*3_desc', 'Cool cornering for your crib y0!', 4119)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*14_desc', 'Aqua table', 4120)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen4_name', 'Gift', 4121)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*4_desc', 'Aquamarine Iced Sofa', 4122)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood3_name', 'Cabbage', 4123)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*5_name', 'Pink Mode Bardesk', 4124)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med_desc', 'Elegance embodied', 4125)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*2_name', 'Red Silk Pillow', 4126)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*2_desc', 'Soft Wool Rug', 4127)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1006_name', 'Hoot Poster', 4128)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*8_desc', 'Rejuvenate your pixels!', 4129)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bath_name', 'Bubble Bath', 4130)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_eric''s_eaterie_name', 'Eric''s Eaterie', 4131)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*1_name', 'Square Dining Table', 4132)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_messagemode_helptext', 'You can choose which kind of message to send to your friends - instant message or email.', 4133)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*5_name', 'Pink Mode Bardesk Corner', 4134)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wave', 'Wave', 4135)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bench_armas_name', 'Bench', 4136)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*9_desc', 'Ultimate coziness', 4137)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*4_desc', 'For nic naks and art deco books', 4138)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_8/0_desc', ' ', 4139)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_edice_desc', 'What''s your lucky number?', 4140)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_rejoin', 'Play again!', 4141)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1_name', 'Ancestor Poster', 4142)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*7_desc', 'Translucent beauty', 4143)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp_armas_name', 'Table Lamp', 4144)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hyacinth2_name', 'Blue Hyacinth', 4145)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_whatsHabboCalled', 'What''s your player called?', 4146)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('shopping_asagift', 'Buy As A Gift', 4147)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*4_desc', 'Energy beams. No trespassers!', 4148)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_small_cactus_name', 'Small Cactus', 4149)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_hours', 'Hours', 4150)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*4_name', 'Beige Safe Minibar', 4151)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*5_name', 'Pink Bar Stool', 4152)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*9_desc', 'Red Mode Double Bed', 4153)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*7_name', 'Coffee Table Green', 4154)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*2_name', 'Globe trophy', 4155)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*5_desc', 'Virtual vanilla rocks!', 4156)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_58_desc', 'Wishing you luck', 4157)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_6_name', 'Snow Rookies Lobby', 4158)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('next', 'Next', 4159)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sniff.dog.2', '*sighs*', 4160)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sniff.dog.1', 'snuh...SNUUUUUH', 4161)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sniff.dog.0', 'snuuh..snuuh', 4162)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_idlewarning', 'You will be replaced if you don''t start or join a Game soon!', 4163)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*2_name', 'Summer Fan', 4164)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_nobalance', 'http://%predefined%//credits/?', 4165)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_email', 'Email', 4166)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_check_info', 'CHECK YOUR INFO', 4167)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_web_internal', 'Housekeeping purchase', 4168)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*2_name', 'Sport goal asphalt', 4169)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*1_desc', 'Glittery gold', 4170)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*2_desc', 'Black Area Armchair', 4171)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_tearoom/0_desc', 'A soothing atmosphere and amazing tea brews.', 4172)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_next', 'Next >', 4173)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_end_text', 'BUT, don''t worry, you can still buy another month of Thor Club and keep all your Thor Club benefits, special Furni gifts and the shiny badge!', 4174)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_floatinggarden_name', 'Floating Garden', 4175)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_desc', 'For larger gatherings', 4176)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_11/0_desc', ' ', 4177)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_bonsai_desc', 'You can be sure it lives', 4178)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_error_room_full', 'The room is full.', 4179)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*3_desc', 'White Area Gate', 4180)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*4_name', 'Serpent of Doom', 4181)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*6_name', 'Blue Area Corner Shelf', 4182)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*1_name', 'Champion trophy', 4183)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_1_name', 'Snow Slingers Lobby', 4184)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.play.cat.1', 'Purrrr.. oo..Purrr', 4185)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.play.cat.0', 'Mew..MEOW..meow', 4186)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bottle_desc', 'For interesting games!', 4187)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_private_helptext', 'These are Thor''s user rooms. Why don''t you go and visit one of them right now? Btw, do you have your own room yet?', 4188)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_help', 'Help - need help?', 4189)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pumpkin_name', 'Pumpkin Lamp', 4190)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hcamme_desc', 'Time for a soak', 4191)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*6_desc', 'Blue Area Coffee Table', 4192)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*6_desc', 'Blue Iced Sofachair', 4193)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*5_desc', 'Soft and tearproof!', 4194)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*7_name', 'Floor Rug', 4195)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_getmessage_sender', 'Sender:', 4196)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_mammoth_name', 'Club Mammoth', 4197)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*3_name', 'Purple Traffic Light', 4198)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp_basic_desc', 'Switch on the atmosphere with this sophisticated light', 4199)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1_desc', 'Neat and natty', 4200)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*5_desc', 'Translucent beauty', 4201)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*6_desc', 'Add an exotic touch to your room', 4202)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_pizza_name', 'Slice of Life', 4203)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_3/0_desc', ' ', 4204)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_private_helptext_hd', 'Midgard', 4205)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_film.help', 'Number Of Photos Left', 4206)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('page', 'page', 4207)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*5_name', 'Chair', 4208)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*4_desc', 'Roll out!', 4209)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*7_name', 'Green Iced  bar desk', 4210)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_1_name', 'Snow Bombardiers Lobby', 4211)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*6_name', 'Blue Mode Bardesk Gate', 4212)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*4_name', 'Beige Area Sofa', 4213)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_500_name', 'Union Jack', 4214)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_requests', 'Friend Request(s)', 4215)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_ok', 'OK', 4216)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budgetb_name', 'Plain Double Bed', 4217)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*11_name', 'Chair', 4218)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_joulutahti_name', 'Poinsetta', 4219)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_daffodil_rug_name', 'Petal Patch', 4220)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_11_name', 'Certificate', 4221)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_8/0_desc', ' ', 4222)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('credit', 'Credit', 4223)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_loading', 'Loading room...', 4224)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*5_name', 'Glass sofa', 4225)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_chair_armas_desc', 'The ultimate recycled furniture', 4226)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*8_name', 'Yellow Silo Dining Chair', 4227)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_logged_out', 'http://%predefined%/account/disconnected?reason', 4228)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_pwd_note', 'Choose a password that''s hard to guess! So, don''t use ANYONES name, or your favorite colour! Your password must include 6-9 characters and have at least one number.', 4229)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('int_howtoget', 'How To get?', 4230)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_pws', 'Password for selected', 4231)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_2_name', 'Free Game Lobby', 4232)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*5_name', 'Pagan Pillar', 4233)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*2_name', 'Bird Bath (green)', 4234)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*9_desc', 'Red Mode Bardesk', 4235)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_fruittree_desc', 'Great yield and sweet fruit', 4236)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*1_name', 'Yellow Road Barrier', 4237)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_armas_name', 'Dining Table', 4238)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_txt3', 'Yes, I''m over 14 years of age\rOR\rI''m under 14 years of age and I have a permission from my parent/guardian to join Thor Club.', 4239)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*6_desc', 'Puffy, soft and huge', 4240)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_txt1', 'You can buy Thor Club one month at a time using Credits.', 4241)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*2_desc', 'It''s both door and a shade!', 4242)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*1_desc', 'Block those rays!', 4243)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*0_name', 'Red Smoke Machine', 4244)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*5_desc', 'Hip plastic furniture', 4245)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*9_desc', 'Red Mode Bardesk Corner', 4246)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*9_name', 'Green Marquee', 4247)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_choose_gametime', 'Choose Game duration:', 4248)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*5_name', 'Brown Water Bowl', 4249)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_36_name', 'The Babes 2', 4250)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med_name', 'Coffee Table', 4251)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*3_desc', 'Hip plastic furniture', 4252)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_rose_name', 'Cut Roses', 4253)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_desc', 'Come and play. It''s free!', 4254)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance', 'Dance', 4255)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*7_name', 'Aqua Spaceship Door', 4256)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_red_tv_name', 'Portable TV', 4257)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*3_name', 'Sport corner grass', 4258)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_510_name', 'The Italian flag', 4259)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budgetb_one_desc', 'All you need for a good night?s kip', 4260)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_footylamp_desc', 'Can you kick it?', 4261)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_confirm_header', 'Subscription costs %price% credits', 4262)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*4_desc', 'Hip plastic furniture', 4263)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*9_desc', 'Practical and convenient', 4264)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_ban_computer', 'Ban Computer Also', 4265)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5_name', 'Plain Iced Angle', 4266)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*2_name', 'Glass table', 4267)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_desc', 'For stand-alone Tournaments.', 4268)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus_locked', 'Locked (visitors have to ring the bell)', 4269)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_21_name', 'Angel Poster', 4270)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*1_name', 'Pink Roller', 4271)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo_desc', 'Totally shatter-proof!', 4272)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*6_desc', 'It''ll blow you away!', 4273)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_rooms_own', 'Own Room(s)', 4274)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*2_name', 'Duo trophy', 4275)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*2_desc', 'Black Area Occasional Table', 4276)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_voucherbutton', 'Vouchers', 4277)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sun_terrace/0_name', 'Sun Terrace', 4278)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*9_name', 'Red Area Occasional Table', 4279)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*2_name', 'Black Iced bar desk', 4280)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem23', 'Beetroot Soda', 4281)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem22', 'Lime Soda', 4282)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Message', 'Message', 4283)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2003_name', 'Dodgy Geezer', 4284)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*5_name', 'Pink Area Armchair', 4285)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem21', 'Hamburger', 4286)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_waiting', 'Change done.\rWaiting for the other players', 4287)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem20', 'Camera', 4288)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_silo_name', 'Bookcase', 4289)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_7_name', 'Tournament Lobby', 4290)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*8_desc', 'Scary and scorching!', 4291)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_house_desc', 'Good enough to eat', 4292)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*2_name', 'Round Dining Table', 4293)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_messenger_updating', 'The console is updating, try again in a minute... Everything else is working fine!', 4294)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_46_name', 'Small gold star', 4295)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*3_name', 'White Bench', 4296)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem19', 'Cola', 4297)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem18', 'Tap', 4298)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem17', 'Java', 4299)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*5_desc', 'Pink Iced gate', 4300)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_xmas/0_desc', 'Step into Christmas!', 4301)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem16', 'Cappuccino', 4302)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*8_name', 'Yellow Ice corner', 4303)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem15', 'Iced', 4304)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem14', 'Filter', 4305)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja_name', 'Bookcase', 4306)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem13', 'Espresso', 4307)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_desc', 'Loo Seat', 4308)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem12', 'Macchiato', 4309)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem11', 'Mocha', 4310)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*3_name', 'White Mode Single Bed', 4311)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem10', 'Latte', 4312)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_dooropens', 'Door opens! Go on in...', 4313)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading', 'Trading', 4314)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_median_lobby/0_desc', 'A Mean place to hang', 4315)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*4_desc', 'Beige Mode Bardesk', 4316)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_roomispwprotected', 'The room is password protected.', 4317)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*2_name', 'Black Iced Sofa', 4318)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_big_cactus_desc', 'Monster in hiding!  Shhhh', 4319)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_intro3', '"My mates live miles away, but we can meet up in my room every Friday night and we don''t have to worry about getting home afterwards." - PinkFruit', 4320)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_intro2', 'Here''s what one player says about her room:', 4321)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_intro1', 'You can decorate and furnish your room however you like and no one can tell you to tidy up or turn the music down. It''s up to you if you let everyone in or just a chosen few, or lock the door and chill by yourself. Get creating and in a couple of minutes ', 4322)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_valentinescreen_name', 'Holiday Romance', 4323)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_edicehc_desc', 'Click and roll!', 4324)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_continue', 'Remove Friend Now', 4325)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_5/0_desc', ' ', 4326)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_newEmail', 'Your new email address:', 4327)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*9_desc', 'Hip plastic furniture', 4328)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus_givepw', 'Password for the room', 4329)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*6_name', 'Blue Solarium', 4330)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*3_desc', 'White Mode Armchair', 4331)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_31_name', 'System of a Ban', 4332)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*8_desc', 'Yellow Area Sofa', 4333)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*4_desc', 'Sleek and chic for each cheek', 4334)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_504_desc', 'The German flag', 4335)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_roomnfo_hd_src', 'Search Rooms', 4336)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*7_name', 'Orange Sleeping Bag', 4337)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie2_name', 'Chocolate Mouse', 4338)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*15_desc', 'Hip plastic furniture', 4339)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*2_name', 'Black Bookcase', 4340)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*a_desc', 'It''s both door and a shade!', 4341)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_15_desc', 'marvellous mountains', 4342)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('BuddyEntry', 'On Thor Front View', 4343)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('remove', 'Remove', 4344)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*9_desc', 'Translucent beauty', 4345)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree1_desc', 'Old Christmas Tree', 4346)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_pizzeria_name', 'Slice of Life', 4347)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*5_name', 'Glass stool', 4348)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa_name', 'Glass sofa', 4349)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_orient/0_name', 'Club Golden Dragon', 4350)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*9_desc', 'Ancient and stately', 4351)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_InviteFriend', 'Invite your friends', 4352)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_timeleft', 'Time Left \x', 4353)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_have2', 'Tickets', 4354)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*2_name', 'Blue Sci-Fi Port', 4355)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_have1', 'You Have', 4356)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_link', 'Click here to see how to get Credits.', 4357)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_creategame', 'Create A New Game', 4358)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_$unit.name$/0_desc', 'Roam more of the corridors', 4359)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_corner_china_name', 'Dragon Screen', 4360)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*7_name', 'Green Mode Double Bed', 4361)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*1_desc', 'It''ll blow you away!e', 4362)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('next_arrows', 'Next >>', 4363)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*3_name', 'Purple Ice Cream Maker', 4364)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_56_name', 'Disco Sign', 4365)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_tile_limit', 'You can not place more then 10 Thor Rollers in your room. \rYou can''t fit more Thor Rollers in this room!', 4366)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*4_desc', 'High technology in a retro frame', 4367)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_toast', 'Toast!', 4368)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_no_credits', 'You don´t have enough Credits for this.', 4369)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_nameAndPassTooSimilar', 'Your name and password are too similar', 4370)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_credits', 'You have \x1 credit(s) in your purse.', 4371)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*a_name', 'Floor Rug', 4372)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_11', 'Nutcase', 4373)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_10', 'Mad', 4374)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fridge_name', 'Pura Refridgerator', 4375)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_congrats', 'Congratulations! You''re now the proud owner of your own room.', 4376)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*3_name', 'Fish trophy', 4377)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo_desc', 'Practical and convenient', 4378)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_514_desc', 'Be proud to be in the Union!', 4379)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_library/0_desc', 'Time to catch up on some studying', 4380)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_8_name', 'Colours Poster', 4381)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_purchasingerror', 'Buying unsuccessful', 4382)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_sms_win_vodafone', 'Vodafone SMS', 4383)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/0_desc', 'Pit your wits on the battlefield, the board or the baize - choose what to play here', 4384)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*6_desc', 'Translucent beauty', 4385)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_link_text2', 'Privacy Pledge', 4386)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_tv_close', 'Leave the Room and close the vision mode.', 4387)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_link_text1', 'See the letter', 4388)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*4_name', 'Beige Area Coffee Table', 4389)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_25_desc', 'Doing a hard night''s work', 4390)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*3_name', 'Orange Inflatable Chair', 4391)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*5_desc', 'The power of movement', 4392)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_red_name', 'Floor Tiles', 4393)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_0/0_desc', ' ', 4394)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_invalidEmail', 'Check email address', 4395)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*3_name', 'Glass chair', 4396)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*4_name', 'Golden Oriental Screen', 4397)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*2_name', 'Silver trophy', 4398)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_extend_text', 'If you''re subscribing again to Thor Club, you won''t lose any of the advantages or ongoing furni gifts. Club membership can be extended in advance.\rRemember: one club month lasts 31 days.', 4399)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.dog.3', 'dog.1', 4400)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.dog.2', 'grRRRRrr.r...r', 4401)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.dog.1', 'Woof! Grrrr..woof woof', 4402)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.dog.0', 'Rrrr..woof.. Rrr', 4403)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('int_newrequests', 'Friend Request(s)', 4404)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2007_desc', 'The legendary founder of Asgard', 4405)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*9_desc', 'Red Area Armchair', 4406)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*2_name', 'Black Iced Auto Shutter', 4407)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_date', 'DATE', 4408)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one_name', 'Single Bed', 4409)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hcsohva_name', 'Throne Sofa', 4410)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck3_name', 'Dead Duck 3', 4411)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*2_desc', 'Hip plastic furniture', 4412)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*6_desc', 'Hip plastic furniture', 4413)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_choosecategory', 'Choose a category for your room.', 4414)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_spyro_name', 'Dragon Egg', 4415)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*7_desc', 'Two can perch comfortably', 4416)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*9_name', 'Square Dining Table', 4417)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('GoAway', 'Leave The Room', 4418)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*4_desc', 'Available in a variety of colours', 4419)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*7_desc', 'Green Mode Single Bed', 4420)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*4_name', 'Green Bear Rug', 4421)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*8_name', 'Yellow Mode Sofa', 4422)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_cinema/0_desc', 'Get your popcorn ready, the movie is about to start!', 4423)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_1/0_desc', ' ', 4424)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*5_desc', 'Cool cornering for your crib y0!', 4425)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*16_desc', 'Hip plastic furniture', 4426)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('camera_open_dialog_heading', 'Camera', 4427)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen6_name', 'Gift', 4428)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*6_desc', 'Blue Iced Sofa', 4429)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1001_desc', 'Even walls have ears', 4430)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_citycounty', 'City                County', 4431)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb_desc', 'A honey-hued glow', 4432)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*7_name', 'Green Mode Bardesk', 4433)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_pineapple_name', 'Pineapple Plant', 4434)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*4_name', 'Gold Feather Pillow', 4435)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*1_desc', 'it''s bouncy-tastic', 4436)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*4_desc', 'Soft Wool Rug', 4437)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month12', 'December', 4438)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_help', 'Thor Help', 4439)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*3_name', 'Square Dining Table', 4440)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month11', 'November', 4441)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.c.info', 'There are %c% Thor Club member(s) in front of you. Be patient :)', 4442)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month10', 'October', 4443)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*7_name', 'Green Mode Bardesk Corner', 4444)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_7/0_desc', ' ', 4445)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_bestPlayer', 'Best Player Is:', 4446)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_10/0_desc', ' ', 4447)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('camera_open_dialog_text', 'Would you like to take some photos\ror put your camera in your room?', 4448)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*6_desc', 'For nic naks and art deco books', 4449)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*1_name', 'Square Dining Table', 4450)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_noemail', 'Sorry,', 4451)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month09', 'September', 4452)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month08', 'August', 4453)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month07', 'July', 4454)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month06', 'June', 4455)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month05', 'May', 4456)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month04', 'April', 4457)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month03', 'March', 4458)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month02', 'February', 4459)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('month01', 'January', 4460)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_newPasswordAgain', 'Retype new password:', 4461)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*9_desc', 'Translucent beauty', 4462)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*2_desc', 'For larger gatherings', 4463)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*6_desc', 'Energy beams. No trespassers!', 4464)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*2_name', 'Plastic Pod Chair', 4465)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('forgottenpw_explanation', 'If you have forgotten your password and you gave your correct email address when you registered, we can send your password to you.', 4466)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*6_name', 'Blue Safe Minibar', 4467)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_nest_desc', 'Night, night', 4468)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*7_name', 'Green Bar Stool', 4469)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('security', 'Security', 4470)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*9_name', 'Large Coffee Table Red', 4471)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*7_desc', 'Virtual vanilla rocks!', 4472)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_8_name', 'Snow Rookies Lobby', 4473)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_agree2', 'Yes, I have read the Thor Terms of Service and I accept them', 4474)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_agree1', 'Yes, my parents and I agree to the above terms. I am allowed to use Thor.', 4475)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_joinedplayers', 'Players Who Joined: \x', 4476)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*4_name', 'SUPERLOVE Fan', 4477)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_favourites_helptext', 'These are your favourite rooms. Nice selection you have here...', 4478)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_0/0_desc', ' ', 4479)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_ok', 'OK', 4480)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*3_desc', 'Breathtaking bronze', 4481)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_agree_alert', 'You have to agree to the terms of service\r(tick the box).', 4482)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_expired_link', 'Click here to join Thor Club', 4483)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_cn_lamp_desc', 'Oriental light', 4484)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t5_3', 'Yleistietoa EOPH ry:st--------------', 4485)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t5_2', 'Huumeista-esite', 4486)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*5_desc', 'Pink Area Gate', 4487)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*6_name', 'Gold Dragon Lamp', 4488)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t5_1', 'Lisetoa huumeista', 4489)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*8_name', 'Yellow Area Corner Shelf', 4490)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*2_desc', 'Two can perch comfortably', 4491)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*3_name', 'Champion trophy', 4492)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_3_name', 'Snow Slingers Lobby', 4493)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.good', 'good', 4494)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*1_desc', 'Glittery gold', 4495)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*2_desc', 'Available in a variety of colours', 4496)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_armas_two_desc', 'King-sized pine comfort', 4497)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*12_name', 'Corner Cabinet/Desk', 4498)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_badge_window_title', 'Badge', 4499)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('tickets_button_info_hide', 'Hide Ticket Info', 4500)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*8_desc', 'Yellow Area Coffee Table', 4501)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_request_2', '(S)he will be added into your Friends List if (s)he accepts it.', 4502)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_xmasduck_name', 'Christmas Rubber Duck', 4503)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*8_desc', 'Yellow Iced Sofachair', 4504)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop_rumble/0_desc', 'Are you ready?', 4505)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_request_1', 'has been sent your Friend Request.', 4506)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*7_desc', 'Soft and tearproof!', 4507)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_keys_run', 'Run:', 4508)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*9_name', 'Floor Rug', 4509)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*3_name', 'White Iced gate', 4510)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*5_name', 'White Traffic Light', 4511)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_answ_count', 'Replies', 4512)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_habbo.bottombar.link.notmember', 'Join!', 4513)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('floodblocking', 'You are typing too fast - don''t flood the room.', 4514)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.c.alert', 'This room is for Thor Club members only. In order to enter, you need to subscribe to Thor Club.', 4515)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3_desc', 'Form following function', 4516)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*2_name', 'Black Mode Bardesk', 4517)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sink_name', 'Sink', 4518)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*7_desc', 'Translucent beauty', 4519)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*8_desc', 'Add an exotic touch to your room', 4520)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_welcome_lounge/0_desc', 'New? Lost? Get a warm welcome here from the Thor eXperts.', 4521)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_privacypledge', 'Privacy Pledge', 4522)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_2/0_desc', ' ', 4523)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain_name', 'Bird Bath (red)', 4524)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*7_name', 'Chair', 4525)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*6_desc', 'Roll out!', 4526)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*9_name', 'Red Iced  bar desk', 4527)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_3_name', 'Snow Bombardiers Lobby', 4528)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*8_name', 'Yellow Mode Bardesk Gate', 4529)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*6_name', 'Blue Area Sofa', 4530)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*2_name', 'Black Chair', 4531)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_502_name', 'The Stars and Stripes', 4532)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_info', 'When you buy Credits with a mobile phone, you will receive a special voucher code. Enter the code in the box above, click ''Get Credits!'' and they''ll be added to your purse.', 4533)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_success', 'Voucher was successfully redeemed. You have the Credits.', 4534)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue*2_name', 'Bronze Elephant', 4535)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*3_desc', 'White Silo Dining Chair', 4536)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*13_name', 'Chair', 4537)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ham_desc', 'Tuck in', 4538)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_13_name', 'BW Skyline Poster', 4539)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wood_tv_name', 'Large TV', 4540)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*7_name', 'Glass sofa', 4541)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_confirm', 'Confirm password:', 4542)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*0_desc', 'Classy architect, for holding up ceilings!', 4543)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_roomname', 'Room name:', 4544)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.e1.alert', 'This room is currently available only to players participating to the event.', 4545)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_general_elapsed', 'Elapsed Months', 4546)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_tsms_win_tmobile', 'T-Mobile SMS', 4547)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_4_name', 'Free Game Lobby', 4548)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_ship4', 'Destroyer(s)', 4549)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*7_name', 'Atlantean Pillar', 4550)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_ship3', 'Cruiser(s)', 4551)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_ship2', 'Battle Ship(s)', 4552)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_ship1', 'An aircraft carrier', 4553)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_520_desc', 'Every colour for everyone', 4554)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_doneheader', 'Congratulations!\rYou''re a player!', 4555)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_space_cafe_name', 'Ten Forward', 4556)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.6', '*dreaming*', 4557)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_3/0_desc', ' ', 4558)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.5', 'Zzzzz wuff! zzzzz', 4559)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*3_name', 'Red Road Barrier', 4560)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.4', 'hrrrrr...murrmm..', 4561)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.3', 'bzz.. oof oof', 4562)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*8_desc', 'Puffy, soft and huge', 4563)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.2', 'hrrr.. hrrr', 4564)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.1', 'bzz.. bzzzzz', 4565)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*4_desc', 'It''s both door and a shade!', 4566)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.dog.0', 'zzZZZzzz', 4567)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus_pwprotected', 'Password protected:', 4568)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*3_desc', 'Block those rays!', 4569)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YourNameIstooShort', 'Player names must be at least 3 characters long.', 4570)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_back', 'Back', 4571)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_title', 'Snow Storm', 4572)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*2_name', 'Blue Smoke Machine', 4573)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*7_desc', 'Hip plastic furniture', 4574)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*14_name', 'Occasional Table', 4575)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*14_name', 'Occasional Table', 4576)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair_desc', 'Translucent beauty', 4577)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_38_name', 'Smiling Headbangerz', 4578)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*5_desc', 'Hip plastic furniture', 4579)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus_open', 'Open', 4580)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon_girl_name', 'Two-seater Sofa', 4581)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*2_desc', 'There out of this world!', 4582)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_12/0_desc', ' ', 4583)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_delete_item', 'Remove Item', 4584)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*9_name', 'Blue Spaceship Door', 4585)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_love_desc', 'Welcome others in style', 4586)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_lmp_desc', 'Be enlightened', 4587)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_lasttime', 'Last Time', 4588)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_512_name', 'The Irish flag', 4589)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva/0_desc', 'Rest your dancing feet!', 4590)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon_desc', 'Loft-style comfort', 4591)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*3_desc', 'White Iced Sofachair', 4592)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_specnum', 'Number of spectators: \x', 4593)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*6_desc', 'Hip plastic furniture', 4594)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_armas_name', 'Barrel Minibar', 4595)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_score_tie', 'The game ended in a tie!', 4596)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize1_desc', 'Gorgeously glittery', 4597)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*4_name', 'Glass table', 4598)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_wrongpw', 'Oops! Sorry, your passwords don''t match. Please enter them again.', 4599)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_23_name', 'Santa Poster', 4600)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_button_extend', 'Extend Membership', 4601)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_lastname', 'Last Name', 4602)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*3_name', 'Aqua Roller', 4603)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*8_desc', 'It''ll blow you away!', 4604)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb*2_desc', 'A honey-hued glow', 4605)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*4_desc', 'Beige Area Occasional Table', 4606)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.e2.alert', 'This room is currently available only to players participating to the event.', 4607)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pizza_name', 'Pizza Box', 4608)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_namedisplayed', 'Do you want your name to be displayed with the room?', 4609)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_kick', 'Kick', 4610)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_2/0_desc', ' ', 4611)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_search_helptext', 'Looking for something? Here you can search other player''s rooms. Type the room name or the name of the player to search for a room.', 4612)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_smooth_table_polyfon_desc', 'For larger gatherings', 4613)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2005_name', 'Infobus', 4614)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*7_name', 'Green Area Armchair', 4615)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.follow_me', 'heel', 4616)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_41_desc', 'For the best music-makers', 4617)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_9_name', 'Tournament Lobby', 4618)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm1_desc', 'Good solid wood', 4619)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon_name', 'Bar/desk', 4620)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*3_desc', 'White Ice corner', 4621)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*4_name', 'Square Dining Table', 4622)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_roomnumber', 'Room number:', 4623)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_alert', 'Moderator Alert', 4624)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_48_name', 'Large gold star', 4625)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*5_name', 'Pink Bench', 4626)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*7_desc', 'Green Iced gate', 4627)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_drinks_name', 'Empty Cans', 4628)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*2_name', 'Doormat', 4629)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_choosecategory', 'Choose a category for your room', 4630)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_underage', 'I am under 11 years old', 4631)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_bobbafilter', 'Bobba filter (filters out bad language)', 4632)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sunset_cafe/0_desc', ' ', 4633)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*3_name', 'White Iced Angle', 4634)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*14_name', 'HC table', 4635)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*4_name', 'Aquamarine Iced Sofa', 4636)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_basic_desc', 'A pura series 300 minibar', 4637)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_RememberSetYourPassword', 'Please check your password', 4638)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*1_desc', 'Rejuvenate your pixels!', 4639)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('epsnotify_1001', ' The game is full at the moment. Please try again in a few minutes.', 4640)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med_name', 'Coffee Table', 4641)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_callforhelp', 'Alert a Moderator', 4642)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_noanswer', 'No answer', 4643)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*2_name', 'Soft Wool Rug', 4644)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_4/0_desc', ' ', 4645)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*8_name', 'Strobe Solarium', 4646)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*2_desc', 'Ultimate coziness', 4647)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*6_desc', 'Sleek and chic for each cheek', 4648)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_506_desc', 'To ''Finnish'' your decor...', 4649)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_head', 'THOR ACCOUNT ACTIVITY', 4650)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round_desc', 'Hip plastic furniture', 4651)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_waiting', 'Waiting to go in...', 4652)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_timefull', 'Sorry, you can only buy up to three months of Thor Club subscription in advance.', 4653)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_ringbell', 'The door is locked. Ringing the bell, and waiting...', 4654)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja_desc', 'A soft iced sofa', 4655)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_button_2_period', 'Buy 3 >>>', 4656)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*9_name', 'Blue Sleeping Bag', 4657)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('people', 'People', 4658)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*4_name', 'Aquamarine Bookcase', 4659)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_17_desc', 'beautiful reproduction butterfly', 4660)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree3_desc', 'Any presents under it yet?', 4661)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_edice_name', 'Holo-dice', 4662)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_info_url', 'http://%predefined%//club/index.html', 4663)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_givepwd', 'Password:', 4664)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*7_name', 'Glass stool', 4665)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*2_desc', 'Black Mode Double Bed', 4666)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_win_coppa', 'You are blocked', 4667)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_chill/0_desc', 'Get ready to meditate!', 4668)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_51_desc', '2 points for every basket', 4669)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*4_name', 'Pink Sci-Fi Port', 4670)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*9_name', 'Red Mode Double Bed', 4671)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help', 'Thor Help', 4672)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*5_name', 'Gold Ice Cream Maker', 4673)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_58_name', 'Red Knots', 4674)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YourPasswordIsTooShort', 'Passwords must be at least 6 characters long. Your password must contain 6-9 characters and have at least one number.', 4675)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_private_norooms', ' You dont have any rooms - create one?', 4676)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*6_desc', 'High technology in a retro frame', 4677)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_header', 'Wallet', 4678)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_thanks_back', 'Great! Back to the game', 4679)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_h5', 'Huumetietoa', 4680)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_h4', 'Anna palautetta', 4681)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_h3', 'Huumetietobussi', 4682)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_h2', 'Harrastamaan!', 4683)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*1_name', 'Duck trophy', 4684)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_h1', 'Puhelintuki', 4685)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*2_name', 'Black Area Armchair', 4686)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_removefriend_2', 'from your Friends List?', 4687)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_removefriend_1', 'Are you sure you want to remove', 4688)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_tearoom/0_name', 'Chinese Tea Room', 4689)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_name', 'Large Coffee Table', 4690)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_bonsai_name', 'Bonsai Tree', 4691)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_3_desc', 'smells fishy, looks cool', 4692)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_nomatch', 'Sorry. Your passwords don''t match. Please enter them again.', 4693)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_profile_create', 'Create your Thor Profile.', 4694)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*3_name', 'White Area Gate', 4695)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_newPassword', 'New password:', 4696)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_516_desc', 'Eng-er-land', 4697)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_email', 'Email:', 4698)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.sit', 'sit', 4699)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bottle_name', 'Empty Spinning Bottle', 4700)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/2_desc', 'Keep your head down, it''s bombs away', 4701)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*8_desc', 'Translucent beauty', 4702)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('navigator', 'Navigator', 4703)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_state_finished', 'This Game is already over!', 4704)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hcamme_name', 'Tubmaster', 4705)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*6_name', 'Blue Area Coffee Table', 4706)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_roomnfo_hd_fav', 'Favourite Rooms', 4707)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*6_name', 'Blue Iced Sofachair', 4708)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_27_desc', 'Deck the halls!', 4709)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*5_name', 'Lime Inflatable Chair', 4710)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*7_desc', 'The power of movement', 4711)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp_basic_name', 'Pura Lamp', 4712)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1_name', 'Corner Shelf', 4713)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_roomdescription', 'Room description:', 4714)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*10_desc', 'There out of this world!', 4715)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*5_name', 'Glass chair', 4716)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*6_name', 'Blue Oriental Screen', 4717)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_banuser', 'Ban User', 4718)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_spectate', 'Watch Game!', 4719)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_alertuser', 'Alert User', 4720)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorC_desc', 'In a hurry?', 4721)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_email_note', 'Please enter your e-mail address, this is important! You''ll only get customer support and special offers via email, if you enter a valid email address and verify it.', 4722)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_18/0_desc', ' ', 4723)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_link_gameRules_url', 'http://www.habbohotel.co.uk/games/battleball/how_to_play.html', 4724)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_4/0_desc', ' ', 4725)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('partner_registration_title', 'Hey, I forgot to mention one thing..', 4726)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*4_name', 'Aquamarine Iced Auto Shutter', 4727)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_onfrontpage', 'On Thor Front View', 4728)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_remrightsconf', 'You are about to remove all rights from your room. This means that only you will have rights to move and place furni in the room.', 4729)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*8_desc', 'Hip plastic furniture', 4730)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*4_desc', 'Hip plastic furniture', 4731)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_create_error', 'Error in room creation process. Please try again!', 4732)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*9_desc', 'Two can perch comfortably', 4733)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*3_desc', 'White Mode Sofa', 4734)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_silo_two_desc', 'Plain and simple x2', 4735)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_armas_one_desc', 'Rustic charm for one', 4736)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_throne_desc', 'Important Players only', 4737)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_chair_armas_name', 'Barrel Stool', 4738)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen1_desc', 'What''s inside?', 4739)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_thanks', 'Yippee! You are now a member of Thor Club!', 4740)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*6_desc', 'Available in a variety of colours', 4741)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*9_desc', 'Red Mode Single Bed', 4742)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_birthday', ' Birthday', 4743)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_email', ' Email', 4744)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bench_lego_desc', 'For your reserve players', 4745)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*7_desc', 'Cool cornering for your crib y0!', 4746)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*8_desc', 'Yellow Iced Sofa', 4747)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1003_desc', 'get the lovely isles on your walls', 4748)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('forgottenpw_email', 'Your email address', 4749)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_updatenote', 'Updating your room properties may take a while. The changes have been made, but it''ll take a few minutes until all players can see them.', 4750)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*9_name', 'Red Mode Bardesk', 4751)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_fruittree_name', 'Fruit Tree', 4752)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*6_name', 'Blue Cotton Pillow', 4753)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*3_desc', 'it''s bouncy-tastic', 4754)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_basket_desc', 'Eggs-actly what you want for Easter', 4755)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*2_desc', 'Black Mode Bardesk Corner', 4756)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*2_name', 'Red Marquee', 4757)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*6_desc', 'Soft Wool Rug', 4758)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop/0_desc', 'Enjoy the spectacular views and visit the Rooftop Cafe!', 4759)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*1_name', 'Yellow Parasol', 4760)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_buyfor', 'Buy Tickets for:', 4761)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_donate_topic', 'SCAM ALERT!', 4762)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_check_age', 'Age', 4763)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*5_name', 'Square Dining Table', 4764)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_sendbutton', 'Get Credits!', 4765)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*9_name', 'Red Mode Bardesk Corner', 4766)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_parent_email', 'The email address you provided is unacceptable.', 4767)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_netcafe_name', 'My Home Netcafe', 4768)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_areYouSure', 'Are you sure you want to delete this item forever?', 4769)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_pets', '/habbo/en/help/features/pets/', 4770)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*8_desc', 'For nic naks and art deco books', 4771)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*3_name', 'Round Dining Table', 4772)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_link_highscores', 'High Scores', 4773)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_partner_registration', 'Partner registration', 4774)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_welcome', 'Welcome To Thor!', 4775)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*2_desc', 'Practical and convenient', 4776)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_title2', 'Email address of parent/guardian:', 4777)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*4_desc', 'For larger gatherings', 4778)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_vastaa', 'Answer the question', 4779)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_search_habbo_lasthere', 'Last time', 4780)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*8_desc', 'Energy beams. No trespassers!', 4781)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budgetb_one_name', 'Plain Single Bed', 4782)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_footylamp_name', 'Football', 4783)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_desc', 'Play battle ball tournament!', 4784)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_main_lobby/0_desc', 'The heart of Thor', 4785)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*4_name', 'Plastic Pod Chair', 4786)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('delete_furniture', 'Delete Furniture (permanently)', 4787)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('decision_ok', 'OK', 4788)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*9_name', 'Red Bar Stool', 4789)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_pizzeria/0_desc', 'Pizza; food of the hungry!', 4790)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_win', 'Assistance', 4791)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('score_board.text', 'POINTS', 4792)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_LogoNameAlreadyUse', 'That name is already being used', 4793)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*9_desc', 'Virtual vanilla rocks!', 4794)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_pagecounter', 'Page', 4795)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo_name', 'Safe Minibar', 4796)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*6_name', 'Ochre Powered Fan', 4797)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*2_name', 'Black Area Occasional Table', 4798)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sunset_cafe_name', 'Sunset Cafe', 4799)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sniff.cat.0', 'snuh..snuh', 4800)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('normal_roomlayouts', '<< Back to normal room layouts', 4801)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_0_name', 'Tournament Lobby', 4802)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*1_desc', 'Out of the deepest blue sea', 4803)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*3_desc', 'White Area Corner Shelf', 4804)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_badge_choose', 'Modify Badge:', 4805)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('previous_onearrowed', '< Previous', 4806)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_easterduck_desc', 'Can you tell what it is yet?', 4807)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_transaction', 'View Transactions', 4808)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_house2_desc', 'Good enough to eat', 4809)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*7_desc', 'Green Area Gate', 4810)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_house_name', 'Gingerbread House', 4811)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*8_name', 'Bronze Dragon Lamp', 4812)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_5_name', 'Snow Slingers Lobby', 4813)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*3_desc', 'Breathtaking bronze', 4814)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*4_desc', 'Available in a variety of colours', 4815)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_gameprice', 'Each Game costs 2 tickets!', 4816)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*5_name', 'Pink Iced gate', 4817)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1*2_desc', 'Crunchy Dog Treat', 4818)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_name', 'Loo Seat', 4819)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_1/0_desc', ' ', 4820)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_updatenote_header', 'Note!', 4821)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*4_name', 'Beige Mode Bardesk', 4822)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*9_desc', 'Translucent beauty', 4823)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_big_cactus_name', 'Mature Cactus', 4824)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*2_desc', 'Hip plastic furniture', 4825)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_publicRooms', 'Asgard', 4826)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*4_desc', 'Aquamarine Iced bar desk', 4827)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_edicehc_name', 'Dicemaster', 4828)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*3_desc', 'White Mode Bardesk Gate', 4829)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habbo_tv_title', 'Widescreen vision', 4830)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*9_name', 'Chair', 4831)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*8_desc', 'Roll out!', 4832)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_5_name', 'Snow Bombardiers Lobby', 4833)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*3_name', 'White Mode Armchair', 4834)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*8_name', 'Yellow Area Sofa', 4835)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*4_name', 'Aquamarine Chair', 4836)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_504_name', 'The Bundesflagge', 4837)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*2_desc', 'Translucent beauty', 4838)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*5_desc', 'Pink Silo Dining Chair', 4839)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*15_name', 'Chair', 4840)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_banlength', 'Ban Length:', 4841)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_info_tickets', 'Gaming Tickets', 4842)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_15_name', 'Himalaya Poster', 4843)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*a_name', 'White Marquee', 4844)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.queue_reset.alert', 'The queue for this room has been reset, please try again.', 4845)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*9_name', 'Glass sofa', 4846)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree1_name', 'Old Christmas Tree', 4847)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*2_desc', 'Ancient and stately', 4848)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_typingmachine_desc', 'Write that bestseller', 4849)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('BuddyNow', 'now:', 4850)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_6_name', 'Free Game Lobby', 4851)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*9_name', 'Rock Pillar', 4852)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_522_desc', 'The flag of Japan', 4853)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('shopping_got', 'You have xx in your Purse.', 4854)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_info_gamePrice', 'Price ', 4855)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*6_desc', 'It''s both door and a shade!', 4856)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_habboprofile_arrowed', 'Profile >>', 4857)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*1_name', 'Blue Powered Fan', 4858)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_passwordContainsNoNumber', 'Password must contain at least one number. Your password must contain 6-9 characters and have at least one number.', 4859)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*2_desc', 'Aqua unlimited', 4860)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*9_desc', 'Hip plastic furniture', 4861)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*4_name', 'Pink Smoke Machine', 4862)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_33_desc', 'We can''t bear to lose them', 4863)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo_desc', 'Cushioned, understated comfort', 4864)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_welcome_lounge_name', 'Welcome Lounge', 4865)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_intermediate_name', 'Playing intermediate game', 4866)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('closed', 'Closed', 4867)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_sent_to_moderators', 'CFH downgraded to non emergency.', 4868)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_cancel', 'Cancel Trading', 4869)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trade', 'Trade', 4870)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_choose_length', 'Choose Length:', 4871)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*7_desc', 'Hip plastic furniture', 4872)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_additems', 'Add Items To Box.', 4873)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*4_desc', 'There out of this world!', 4874)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_dusty_lounge/0_desc', ' ', 4875)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_terms', 'Welcome to Thor.  If you are under 16, please check the Terms and Conditions with your parents/guardian before you agree to them. Get them to explain anything that you don''t understand.\rIn order to use the service you have to give valid information about', 4876)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gen_youhave', 'You Have', 4877)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budget_desc', 'Sweet dreams for two', 4878)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify', 'Modify', 4879)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo_name', 'Bar Stool', 4880)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2_desc', 'Strong, yet soft looking', 4881)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_5min', '5min', 4882)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva/2_desc', 'Make all the right moves', 4883)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_library/0_name', 'Thor Library', 4884)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_514_name', 'The EU flag', 4885)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_red_desc', 'Loo Seat', 4886)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*8_desc', 'Hip plastic furniture', 4887)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_expert_0_name', 'Snow Marksmen Lobby', 4888)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_name', 'Theatredrome', 4889)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_olderage', 'I am older than 11 years of age', 4890)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_giftfor', 'This is a gift for:', 4891)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize3_desc', 'A weighty award', 4892)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_error_text', 'Sorry, but you haven''t filled in all the required fields on the form Please go back and try again', 4893)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*6_name', 'Glass table', 4894)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_25_name', 'Reindeer Poster', 4895)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*5_name', 'Knight Roller', 4896)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_intro_text', 'Members of Thor Club get LOTS of cool stuff!\rWith Thor Club you get cool dances and access to special rooms!', 4897)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_join_7', 'You have already joined this Game!', 4898)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*6_desc', 'Blue Area Occasional Table', 4899)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_6/0_desc', ' ', 4900)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_habbo.window.title', 'Thor Club', 4901)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_join_3', 'You either have too much or too little skill to join.', 4902)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_inprivateroom', 'In A Guest Room', 4903)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_join_0', 'The team you selected is already full.', 4904)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2000_desc', 'Suomen kartta', 4905)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_ask_friend', 'Ask to be a Friend', 4906)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_postcountry', 'Postcode          Country', 4907)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('messenger', 'Messenger', 4908)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2007_name', 'The Father Of Thor', 4909)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*9_name', 'Red Area Armchair', 4910)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_user_skill', 'Skill Level: \x\rScore: \y', 4911)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_43_desc', 'Shake, rattle and roll!', 4912)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm3_desc', 'Knock, knock...', 4913)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_shoot.help', 'Shutter Release', 4914)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habburger''s_name', 'Habburgers', 4915)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*5_desc', 'Pink Ice corner', 4916)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*6_name', 'Round Dining Table', 4917)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*2_name', 'Round Dining Table', 4918)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*7_name', 'Green Bench', 4919)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*9_desc', 'Red Iced gate', 4920)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*4_name', 'Doormat', 4921)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*7_name', 'Green Mode Single Bed', 4922)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*5_name', 'Pink Iced Angle', 4923)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_chr_desc', 'Royal comfort', 4924)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*16_name', 'Occasional Table', 4925)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*6_name', 'Blue Iced Sofa', 4926)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_value', 'VALUE', 4927)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1001_name', 'Prince Charles Poster', 4928)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*3_desc', 'Rejuvenate your pixels!', 4929)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_savetxt', 'Saving Photo...', 4930)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb_name', 'Blue Amber Lamp', 4931)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_birthdayformat', 'Birthday*: [dd][mm][yyyy]', 4932)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*1_name', 'Rubber Ball', 4933)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_profilematch', 'Thor Profile match -', 4934)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*4_name', 'Soft Wool Rug', 4935)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*7_desc', 'Green Mode Armchair', 4936)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*4_desc', 'Ultimate coziness', 4937)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*8_desc', 'Sleek and chic for each cheek', 4938)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_price1.days', '30', 4939)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_508_desc', 'The flag of Spain', 4940)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_ice_cafe_name', 'Ice Cafe', 4941)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*6_name', 'Blue Bookcase', 4942)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_19_desc', 'Trying to get in or out?', 4943)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*2_desc', 'Translucent beauty', 4944)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree5_desc', 'Any presents under it yet?', 4945)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_countdown', 'Game Is About To Begin', 4946)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_silo_one_desc', 'Plain and simple', 4947)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_odotetaan', 'Waiting for replies from others...', 4948)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*9_name', 'Glass stool', 4949)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_updateOK', 'Update successful', 4950)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*4_desc', 'Beige Mode Double Bed', 4951)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_navigator', 'Navigator - navigate around', 4952)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_main_infotext', 'If you feel like splashing out on some Thor Credits, Splash Plastic is the ideal way to pay!\r\rSplash Plastic works in much the same way as a pay-as-you-go mobile phone - when the cash on the card runs out, you ''top it up'' with some more money. And it''s ', 4953)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*2_name', 'Large Coffee Table Black', 4954)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*0_desc', 'Virtual vanilla rocks!', 4955)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_53_desc', 'whack that ball!', 4956)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*6_name', 'White Sci-Fi Port', 4957)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table_desc', 'Translucent beauty', 4958)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_1_name', 'Snow Rookies Lobby', 4959)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_emperors_name', 'Emperor''s hall', 4960)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*1_desc', 'Let''s get sporty!', 4961)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_nest_name', 'Basket', 4962)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_snowwar_lobby/0_desc', 'Snow Storm LobbyCome and be a Snow Stormer!', 4963)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*7_name', 'Choco Ice Cream Maker', 4964)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('error_title', 'Oops, error!', 4965)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*8_desc', 'High technology in a retro frame', 4966)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_badge_button', 'Badge', 4967)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sandrug_desc', 'Your own paradise island', 4968)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_scores_team_4', 'Green Team:', 4969)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_coins', 'Thor Credits', 4970)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_scores_team_3', 'Yellow Team:', 4971)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_current_2', 'You are in queue for the room.', 4972)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_scores_team_2', 'Blue Team:', 4973)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_current_1', 'You are in Thor Live queue...', 4974)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_dsk_desc', 'For scholars', 4975)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_scores_team_1', 'Red Team:', 4976)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ModeratorWarning', 'Message from a Moderator:', 4977)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*3_name', 'Duck trophy', 4978)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t4_2', 'Tsekkaa heebelin jorinat', 4979)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t4_1', 'Anna palautetta Hubusta', 4980)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reject', 'Reject', 4981)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_event', 'ACTIVITY', 4982)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_cn_lamp_name', 'Chinese Lantern', 4983)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_5_desc', 'quacking good design!', 4984)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*5_name', 'Pink Area Gate', 4985)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_518_desc', 'A fiery dragon for your wall', 4986)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*2_name', 'Black Bench', 4987)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('number_4', '4', 4988)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.lie', 'lie down', 4989)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('number_3', '3', 4990)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*1_name', 'Classic trophy', 4991)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*8_desc', 'Totally shatter-proof!', 4992)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*2_name', 'Floor Rug', 4993)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_armas_two_name', 'Double Bed', 4994)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('number_2', '2', 4995)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_snowwar_lobby_name', 'Snow Storm Lobby', 4996)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/4_desc', 'Get a hand like a foot? Keep a straight face and bluff it out', 4997)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_gift_title', 'You have received a Thor club gift!', 4998)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*8_name', 'Yellow Area Coffee Table', 4999)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*8_name', 'Yellow Iced Sofachair', 5000)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_29_desc', 'A touch of festive sparkle', 5001)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*7_name', 'White Inflatable Chair', 5002)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*1_desc', 'Add an exotic touch to your room', 5003)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*9_desc', 'The power of movement', 5004)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_termslink', 'Terms and Conditions', 5005)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_armas_desc', 'Adds instant warmth', 5006)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_median_lobby_name', 'Median Lobby', 5007)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_choise2', 'Buy 20 Tickets for 6 Credits.', 5008)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3_name', 'Gate (lockable)', 5009)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_choise1', 'Buy 2 Tickets for 1 Credits.', 5010)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_time', 'TIME', 5011)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*7_name', 'Glass chair', 5012)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*8_name', 'Night Blue Oriental Screen', 5013)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_mission', 'Your Mission:', 5014)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Room', 'Room:', 5015)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja_desc', 'Two can perch comfortably', 5016)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_8/0_desc', ' ', 5017)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar_desc', 'For cuddling up on', 5018)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_placeship', 'Place your ships:', 5019)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_beauty_salon_loreal_name', 'Beauty salon', 5020)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.cat.3', '*hiss*', 5021)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*6_name', 'Blue Iced Auto Shutter', 5022)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.cat.2', 'Tssssss!', 5023)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.cat.1', 'MrrRRRR', 5024)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.angry.cat.0', 'Sssppp!', 5025)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rcandleset_desc', 'Simple but stylish', 5026)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*6_desc', 'Hip plastic furniture', 5027)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_legotrophy_desc', 'For the winning team', 5028)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*3_name', 'White Silo Dining Chair', 5029)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_info', 'You must know the correct birthday and password before you''re allowed to make these changes.', 5030)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*1_desc', 'Cute', 5031)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ham_name', 'Joint of Ham', 5032)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen3_desc', 'What''s inside?', 5033)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*0_name', 'Greek Pillar', 5034)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood2_desc', 'Fresh catch of the day', 5035)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chess_white', 'White:', 5036)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*9_desc', 'Cool cornering for your crib y0!', 5037)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*1_desc', 'Puffy, soft and huge', 5038)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_days', 'Days', 5039)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_rooms_favourite', 'Favourites', 5040)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1005_desc', 'The muscly movie hero', 5041)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_owner', 'Owner', 5042)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_9', 'Tireless', 5043)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_8', 'Lively', 5044)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_520_name', 'The Rainbow Flag', 5045)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_7', 'Energetic', 5046)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_6', 'Active', 5047)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_5', 'Sprightly', 5048)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_trouble', 'In Trouble?', 5049)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_4', 'Relaxed', 5050)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_3', 'Lazy', 5051)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_2', 'Sluggish', 5052)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_1', 'Slow', 5053)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*8_name', 'Navy Cord Pillow', 5054)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*4_desc', 'Beige Mode Bardesk Corner', 5055)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_hit', 'A Hit!:', 5056)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_enrg_0', 'Tired', 5057)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*4_name', 'Yellow Marquee', 5058)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cancel', 'Cancel', 5059)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*3_name', 'Violet Parasol', 5060)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*7_name', 'Square Dining Table', 5061)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_deleteroom', 'Delete', 5062)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_samovar_desc', 'Click for a refreshing cuppa', 5063)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_friends_helptext', 'This screen shows a list of all your Thor Friends. It tells you where they are in the game, or, if they''re not checked in, when their last visit was.', 5064)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Messages', 'Message(s)', 5065)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair_name', 'Glass chair', 5066)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_removefavourites', 'Remove from favourites', 5067)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*5_name', 'Occasional Table', 5068)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hyacinth1_desc', 'Beautiful bulb', 5069)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_txtscreen.help', 'Caption', 5070)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*2_name', 'Yellow Spaceship Door', 5071)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*3_desc', 'Totally shatter-proof!', 5072)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*4_desc', 'Practical and convenient', 5073)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_love_name', 'Doormat', 5074)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_lmp_name', 'Oil Lamp', 5075)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*6_desc', 'For larger gatherings', 5076)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*1_desc', 'Glittery gold', 5077)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon_name', 'Armchair', 5078)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*3_name', 'White Iced Sofachair', 5079)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*6_name', 'Plastic Pod Chair', 5080)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_trad_one_desc', 'All you need for a good night?s kip', 5081)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_now', 'now:', 5082)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize1_name', 'Gold Trophy', 5083)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_hammock_desc', 'Eco bed', 5084)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rcandle_desc', 'Xmas tea light', 5085)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('human_carrying', 'Carrying:', 5086)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_BattleShip', 'Battleships', 5087)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*1_desc', 'Let''s get sporty!', 5088)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_habboname_note', 'Now it''s time to make your own Thor character! To make your own player, please start by choosing your player name.', 5089)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*8_name', 'Turquoise Powered Fan', 5090)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb*2_name', 'Yellow Amber Lamp', 5091)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_figurecreator', 'Thor Details', 5092)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop_name', 'Rooftop Cafe', 5093)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*4_name', 'Beige Area Occasional Table', 5094)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance_stop', 'Stop Dancing', 5095)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bartable_armas_desc', 'Bar-Style Table - essential for extra guests', 5096)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_gift.message', 'Happy Thor Club! From the Manager!', 5097)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chess_black', 'Black:', 5098)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_email', 'Email', 5099)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_smooth_table_polyfon_name', 'Large Dining Table', 5100)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_tearoom_name', 'Chinese Tea Room', 5101)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YouAreBanned', 'Thor has used his hammer. You have been banned. This is why:', 5102)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_19/0_desc', ' ', 5103)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_goswimming', 'Go swimming!', 5104)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('move', 'Move', 5105)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_2_name', 'Tournament Lobby', 5106)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*3_desc', 'Scary and scorching!', 5107)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*5_desc', 'Pink Area Corner Shelf', 5108)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('callhelp_allwillreceive', 'Thank you for submitting a question. It will be reviewed and answered. Please do not send this question again, we will get to it as quickly as possible.\r\rThe FAQ may hold the answer to your question, please take a moment to review it', 5109)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_messenger', 'Console SMS', 5110)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_sunflower_desc', 'For happy players', 5111)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_41_name', 'Golden Record', 5112)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*9_desc', 'Red Area Gate', 5113)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm1_name', 'Corner plinth', 5114)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_7_name', 'Snow Slingers Lobby', 5115)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*6_desc', 'Available in a variety of colours', 5116)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*3_name', 'White Ice corner', 5117)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ok', 'OK', 5118)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*2_desc', 'Chill and wait your turn!', 5119)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wall_china_desc', 'For your great wall', 5120)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*7_name', 'Green Iced gate', 5121)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_extend_title', 'Thor Club membership can be extended VERY easily.', 5122)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_10', 'The game is closed or about to close. We look forward to welcoming you back tomorrow.', 5123)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('no', 'No', 5124)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_basic_name', 'A Pura Minibar', 5125)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_polyfon_desc', 'For the arty pad', 5126)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*4_desc', 'Hip plastic furniture', 5127)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*1_name', 'Black Solarium', 5128)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*6_desc', 'Blue Iced  bar desk', 5129)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('log_problem_text', 'Oops.. Cannot connect to Thor :(', 5130)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*5_desc', 'Pink Mode Bardesk Gate', 5131)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*3_desc', 'White Area Sofa', 5132)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_credits', 'You have \x Credits in your purse.', 5133)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_forgottenPassword_url', 'http://%predefined%//iot/go?lang', 5134)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_update_text', 'Never change your password or email just because somebody asks you to. He / she is most probably trying to steal your Thor account and furni!', 5135)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_createroom', 'Create Own Room', 5136)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_badge_visible', 'Visible', 5137)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*2_name', 'Lime Sleeping Bag', 5138)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*10_desc', 'Hip plastic furniture', 5139)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_yukka_desc', 'Easy to care for', 5140)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*6_name', 'Blue Chair', 5141)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_506_name', 'The flag of Finland', 5142)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_club_sofa_desc', 'Club sofa', 5143)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_10_desc', 'a beautiful sunset', 5144)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round_name', 'Round Dining Table', 5145)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*4_desc', 'Translucent beauty', 5146)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja_name', 'iced sofa', 5147)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*7_desc', 'Green Silo Dining Chair', 5148)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*11_desc', 'Hip plastic furniture', 5149)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty_desc', 'Hip plastic furniture', 5150)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_0_name', 'Amateur', 5151)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_creditcards_is', 'Credit card', 5152)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg_desc', 'Hip plastic furniture', 5153)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_17_name', 'Butterfly Cabinet', 5154)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_accept', 'Remove Friends', 5155)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_youhave', 'You Have', 5156)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree3_name', 'Christmas Tree 1', 5157)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*4_desc', 'From the time of the Kick Warz', 5158)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*1_desc', 'For our feathered friends', 5159)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_hway', 'Players are expected to follow the Thor rules even if word filtering is switched off.', 5160)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome/0_desc', 'I still miss Ralph, I really really do.', 5161)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*2_name', 'Black Mode Double Bed', 5162)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_8_name', 'Free Game Lobby', 5163)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_chill/0_name', 'Zen Garden', 5164)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_51_name', 'Basketball Hoop', 5165)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_lounge_skill', 'Level in this Lounge: \x \r (\y-\z points)', 5166)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*8_desc', 'It''s both door and a shade!', 5167)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*6_name', 'White Smoke Machine', 5168)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*4_desc', 'Aqua unlimited', 5169)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_35_desc', 'The game''s girlband. Dream on!', 5170)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.cat.4', 'mrrrr...muew..mrr', 5171)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.cat.3', 'hurrr..hurrr', 5172)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.cat.2', 'Purrr... rrrr', 5173)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.cat.1', 'mrrrr..rrrr..', 5174)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.sleep.cat.0', 'hrrrrr....Mrrrrr.', 5175)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_congrat', 'Congratulations!', 5176)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen_desc', 'What''s inside?', 5177)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_chill_name', 'Zen Garden', 5178)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('receivers2', 'Receiver(s):', 5179)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_messenger', 'Messenger - friends & messages on here', 5180)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*9_desc', 'Hip plastic furniture', 5181)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_desc', 'In a choice of colours', 5182)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_main_lobby_name', 'Main Lobby', 5183)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*6_desc', 'Monolith goes up! Monolith goes down!', 5184)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_roomdescription', 'Room Description', 5185)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*2_desc', 'Let''s get sporty!', 5186)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo_desc', 'Large, but worth it', 5187)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_link_highScores_url', '(URL TO SNOWWAR HIGH SCORES)', 5188)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_stand_desc', 'Stand and Deliver!', 5189)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_3_name', 'Fish Plaque', 5190)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4_desc', 'Roll out!', 5191)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_3teams', '3 Teams Game', 5192)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_516_name', 'The English flag', 5193)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.dog.3', 'hooooowl', 5194)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.dog.2', 'wooooof!', 5195)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.dog.1', 'woof woof woof!!!', 5196)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_20_desc', 'A new use for carrots!', 5197)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.dog.0', 'woof..woof', 5198)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_expert_2_name', 'Snow Marksmen Lobby', 5199)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*0_desc', 'The power of movement', 5200)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_fieldname_5', 'Polar Labyrinth', 5201)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_fieldname_4', 'Frosty Forest', 5202)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*1_desc', 'Glittery gold', 5203)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/2_name', 'Noughts&Crosses', 5204)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*8_name', 'Glass table', 5205)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_fieldname_3', 'Glacial Fort', 5206)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_fieldname_2', 'Algid River', 5207)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_fieldname_1', 'Arctic Island', 5208)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_27_name', 'Holly Garland', 5209)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*7_name', 'Purple Roller', 5210)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_14/0_desc', ' ', 5211)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*8_desc', 'Yellow Area Occasional Table', 5212)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*10_name', 'Violet Spaceship Door', 5213)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_tutorial_url', ' ', 5214)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2002_desc', 'Presidentin muotokuva', 5215)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*4_desc', 'Beige Area Armchair', 5216)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_ok_text', 'You have chosen enough friends to remove.', 5217)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_purse', 'Thor Wallet', 5218)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_asktobecomeafriend', 'Ask To Become A Friend', 5219)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_buy_coins', 'Buy Credits', 5220)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorC_name', 'Portaloo', 5221)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*1_desc', 'Hip plastic furniture', 5222)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_45_desc', 'Needs a few more Habburgers', 5223)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_warning', 'Moderator says:', 5224)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*7_desc', 'Green Ice corner', 5225)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*4_name', 'Square Dining Table', 5226)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*15_desc', 'Hip plastic furniture', 5227)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*8_name', 'Round Dining Table', 5228)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*2_desc', 'Black Mode Single Bed', 5229)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_htk_singledrop', 'Landline', 5230)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*9_name', 'Red Bench', 5231)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_leavegame', 'Leave Game', 5232)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*3_name', 'White Mode Sofa', 5233)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_silo_two_name', 'Double Bed', 5234)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_armas_one_name', 'Single Bed', 5235)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_change_url', '(link from renewal dialog 2 to subscription page)', 5236)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_throne_name', 'Throne', 5237)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen1_name', 'Gift', 5238)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_lounge_skill_no_min', 'No minimum', 5239)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*6_name', 'Doormat', 5240)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*9_name', 'Red Mode Single Bed', 5241)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_exitbutton', 'Cancel', 5242)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_give_trophymsg', 'You haven''t engraved the trophy. Type \ryour inscription in the grey box.', 5243)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('go', 'Go >>', 5244)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_donetext', 'Soon you''ll see the navigator, it shows you all the rooms you can go to -the guest rooms, clubs, cafés, swimming pools and more!', 5245)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bench_lego_name', 'Team Bench', 5246)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_turn2', 'The Enemy''s Turn', 5247)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*7_name', 'Green Iced Angle', 5248)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_turn1', 'Your Turn', 5249)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster__desc', 'Oriental seating for three', 5250)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_triplecandle_desc', 'No need to worry about wax drips', 5251)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*8_name', 'Yellow Iced Sofa', 5252)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_link_tournament_highScores_url', '(URL TO SNOWWAR TOURN HIGHSCORES)', 5253)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1003_name', 'UK Map', 5254)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_valentine/0_desc', 'Hug A Friend, Its Valentines!  Home Of Ralph (Wannabe Panda In Training)', 5255)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*5_desc', 'Rejuvenate your pixels!', 5256)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_spam', 'Yes, I want to get the occasional email from the Game Manager.', 5257)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_security', 'Security', 5258)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_30_desc', 'Pucker up', 5259)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_basket_name', 'Basket Of Eggs', 5260)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*3_name', 'Rubber Ball', 5261)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*2_name', 'Black Mode Bardesk Corner', 5262)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budget_one_desc', 'All you need for a good night?s kip', 5263)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*6_name', 'Soft Wool Rug', 5264)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*9_desc', 'Red Mode Armchair', 5265)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*6_desc', 'Ultimate coziness', 5266)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1_desc', 'Crunchy Dog Treat', 5267)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('whisper', 'Whisper', 5268)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_WrongPassword', 'Check password!', 5269)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*1_desc', 'There out of this world!', 5270)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('paalu.winner', 'Winner:', 5271)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_floatinggarden/0_desc', 'Beware Pirates!', 5272)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*8_name', 'Yellow Bookcase', 5273)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_9', 'Loyal', 5274)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_mainhelptext', 'You can use the Thor Console to keep in constant contact with your friends, using instant messages and email, even when they are offline.', 5275)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_8', 'Loving', 5276)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_7', 'Affectionate', 5277)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_6', 'Warm', 5278)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*4_desc', 'Translucent beauty', 5279)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_5', 'Friendly', 5280)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_4', 'Calm', 5281)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_3', 'Cool', 5282)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_2', 'Suspicious', 5283)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_goingprivate', 'Going Guest room', 5284)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_1', 'Angry', 5285)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_0', 'Hostile', 5286)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_retypepass', 'Retype Password:', 5287)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*1_desc', 'Energy beams. No trespassers!', 5288)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_pet_name_length', 'Oops, pet''s name is too long (max 15 characters)', 5289)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_friends', 'Friends', 5290)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_0/0_desc', ' ', 5291)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_create_3', 'Your skill level isn''t high enough for creating Games in this Lobby.', 5292)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_link_gamerules', 'Game Rules', 5293)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_refunds', 'Refund', 5294)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_create_0', 'This Lobby is full, please create a Game in another Lobby!', 5295)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*2_name', 'Black Bar Stool', 5296)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*6_desc', 'Blue Mode Double Bed', 5297)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_release.help', 'Cancel Photo', 5298)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*4_name', 'Large Coffee Table Aquamarine', 5299)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*2_desc', 'Virtual vanilla rocks!', 5300)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker', 'POKER', 5301)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_55_desc', 'relaxing scene', 5302)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_InvalidUserName', 'Don''t use this character: \x !', 5303)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*8_name', 'Purple Sci-Fi Port', 5304)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_3_name', 'Snow Rookies Lobby', 5305)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ChooseWhoToSentMessage', 'Please choose who to\rsend your message to', 5306)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_6', 'Ecstatic', 5307)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_5', 'Joyful', 5308)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_heart_desc', 'Full of love', 5309)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_4', 'Happy', 5310)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hockey_score_desc', '...for keeping your score', 5311)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_3', 'Contented', 5312)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_2', 'Blue', 5313)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_1', 'Depressed', 5314)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_mood_0', 'Miserable', 5315)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*9_name', 'Fucia Ice Cream Maker', 5316)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_emergency_whathappens', 'Our Moderators will receive your Call for Help. One of them will have a look at what has been said and take appropriate action, which might include coming to talk to you about it.', 5317)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_message_from', 'Moderator reply to your CFH:', 5318)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_checking', 'Checking code, please wait...', 5319)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_buyingSuccesfull', 'Buying Succesful!', 5320)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_skylight_lobby/0_desc', 'Lift your spirits on the top floor', 5321)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*2_desc', 'Shiny silver', 5322)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('update_password_suggest', 'Thor security supervisor requests you to update your password', 5323)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_incorrectflatpw', 'Incorrect, try again.', 5324)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*1_name', 'Sea Dragon Lamp', 5325)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*3_name', 'White Area Corner Shelf', 5326)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_7_desc', 'for emergencies only', 5327)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_easterduck_name', 'Wannabe bunny', 5328)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_house2_name', 'Gingerbread House', 5329)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*7_name', 'Green Area Gate', 5330)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*3_desc', 'White Area Coffee Table', 5331)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_forcedupdate', 'Please update your player details!', 5332)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*2_desc', 'Soft and tearproof!', 5333)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*3_name', 'Classic trophy', 5334)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*4_name', 'Floor Rug', 5335)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_remove_specs', 'Sorry! Now it''s someone else''s turn to watch this event.', 5336)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_open_package', 'Open The Present', 5337)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_canmodifysettings', '(You can change these settings later)', 5338)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_0_name', 'Intermediate', 5339)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*2_desc', 'Translucent beauty', 5340)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_user_skill', 'Snow Storm Skill Level: \x \r (\y points)', 5341)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*3_desc', 'Add an exotic touch to your room', 5342)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1*2_name', 'Marzipan Man', 5343)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_polyfon_desc', 'Metallic seating experience', 5344)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_menorah_desc', 'Light up your room', 5345)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_password', 'Password', 5346)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*1_desc', 'Gold trophy', 5347)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fireplace_armas_desc', 'Authentic, real flame fire', 5348)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_prev', '< Previous', 5349)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_noevents', 'You haven''t made any transactions yet. Click the button below to find out how to get credits.\rRemember: you must ask your parents permission before you buy credits.', 5350)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*9_name', 'Glass chair', 5351)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_16/0_desc', ' ', 5352)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*2_name', 'Chair', 5353)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*4_name', 'Aquamarine Iced bar desk', 5354)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_habbo.bottombar.link.member', '%days% days', 5355)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*3_name', 'White Mode Bardesk Gate', 5356)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_fav_hd', 'Your Favourite Rooms.', 5357)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck2_desc', 'Someone forgot to feed me...', 5358)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_error_toomanyfavrooms', 'You can''t have more than 10 favourite rooms! Please remove an old favourite if you want to add a new one.', 5359)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*8_name', 'Yellow Iced Auto Shutter', 5360)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*2_name', 'Glass sofa', 5361)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*8_desc', 'Hip plastic furniture', 5362)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ticket_desc', 'A bundle of 17 gaming tickets', 5363)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*5_name', 'Pink Silo Dining Chair', 5364)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_confirm_body', 'You have %credits% credits', 5365)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*3_desc', 'Snuggle up on a Funky bear rug...', 5366)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*7_desc', 'Green Mode Sofa', 5367)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_go_started', 'Watch', 5368)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_armas_desc', 'For all those fire-side stories', 5369)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen5_desc', 'What''s inside?', 5370)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_chooselayout', 'Choose the layout of your room', 5371)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*2_name', 'Nordic Pillar', 5372)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_typingmachine_name', 'Typewriter', 5373)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_choose_gamename', 'Enter A Name For Your Game:', 5374)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_china_table_desc', 'Exotic and classy', 5375)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_emergency_help', 'Call for emergency help:', 5376)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_8/0_desc', ' ', 5377)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_changePassword', 'Change your password', 5378)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3_desc', 'All bars should have one', 5379)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo_desc', 'Keep it simple', 5380)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*6_desc', 'Blue Mode Bardesk', 5381)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_names_ordered', 'Names Ordered By:', 5382)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YourPasswordIstooShort', 'Room password is too short. It must be at least 6 characters long', 5383)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*3_desc', 'Puffy, soft and huge', 5384)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_lounge_skill_no_max', 'Infinite', 5385)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_522_name', 'The flag of Japan', 5386)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*2_desc', 'Hip plastic furniture', 5387)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_whatis', 'What is Thor Club?', 5388)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('say', 'Say', 5389)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*6_desc', 'Blue Mode Bardesk Corner', 5390)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*6_name', 'Blue Marquee', 5391)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_head2', 'ACCOUNT TRANSACTIONS', 5392)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_lido_name', 'Habbo Lido', 5393)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*9_name', 'Square Dining Table', 5394)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*2_name', 'Green Water Bowl', 5395)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_33_name', 'Save the Panda', 5396)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo_name', 'Two-Seater Sofa', 5397)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_error_room_closed', 'The room is closed.', 5398)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_price', 'One month costs 25 credits.', 5399)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_user_page', 'Home Page', 5400)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*7_name', 'Occasional table', 5401)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*4_name', 'Jade Spaceship Door', 5402)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budget_name', 'Plain Double Bed', 5403)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*1_desc', 'Hip plastic furniture', 5404)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*5_desc', 'Totally shatter-proof!', 5405)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_other_2', 'Room queue status', 5406)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*6_desc', 'Practical and convenient', 5407)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_other_1', 'Live queue status', 5408)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2_name', 'Ice Bar-Desk', 5409)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_11/0_desc', ' ', 5410)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*8_desc', 'For larger gatherings', 5411)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*3_desc', 'Breathtaking bronze', 5412)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.voice', 'speak', 5413)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva/2_name', 'Dancefloor', 5414)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_2/0_desc', ' ', 5415)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_red_name', 'Loo Seat', 5416)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*8_name', 'Plastic Pod Chair', 5417)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_desc', 'Practice improves a Snow Stormer''s aim... Ops, missed!', 5418)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*3_desc', 'It''ll blow you away!', 5419)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize3_name', 'Bronze Trophy', 5420)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_agrees', 'Agree', 5421)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.come_here', 'come here', 5422)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_ballroom/0_desc', 'It''s Going Away!', 5423)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*3_desc', 'Let''s get sporty!', 5424)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hallway_name', 'Hallway', 5425)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_header', 'Choose %amount% friends to remove', 5426)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_note', 'NOTE : The transactions are updated at 6 am every day.', 5427)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*6_name', 'Blue Area Occasional Table', 5428)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_go_finished', 'Scores', 5429)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_gate_park_name', 'Imperial Park', 5430)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_ban_ip', 'Ban IP Also', 5431)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_firstmiddle', 'First Name & Middle name', 5432)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2000_name', 'Suomen kartta', 5433)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_next_msg', 'Delete', 5434)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_windowheader', 'Your friends list is full.', 5435)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_4_name', 'Tournament Lobby', 5436)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*5_desc', 'Roast your chestnuts here!', 5437)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*7_desc', 'Green Area Corner Shelf', 5438)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*2_desc', 'Shiny silver', 5439)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_newgame', 'New game', 5440)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_desc_2_period', '3 Months (93 days) ', 5441)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_ticket', 'Ticket', 5442)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_owner', 'Owner:', 5443)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_43_name', 'Chains', 5444)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm3_name', 'Gate (lockable)', 5445)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_girl_desc', 'Snuggle down in princess pink', 5446)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_picnic/0_desc', 'Feeling lazy? Come and laze in the sun for a while!', 5447)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*8_desc', 'Available in a variety of colours', 5448)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*2_desc', 'Black Iced gate', 5449)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*5_name', 'Pink Ice corner', 5450)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*4_desc', 'Chill and wait your turn!', 5451)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_helpterms', 'http://%predefined%//footer_pages/terms_and_conditions.html', 5452)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_create1here', 'You can create one here.', 5453)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_choise_header', 'What do you need help with?', 5454)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*9_name', 'Red Iced gate', 5455)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_chr_name', 'Majestic Chair', 5456)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_figure_editor', 'http://%predefined%//profile/profile.action', 5457)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_offline', 'Offline', 5458)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*6_desc', 'Hip plastic furniture', 5459)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*3_name', 'Aquamarine Solarium', 5460)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*8_desc', 'Yellow Iced  bar desk', 5461)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*7_desc', 'Green Mode Bardesk Gate', 5462)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_11', 'Devoted', 5463)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*5_desc', 'Pink Area Sofa', 5464)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chess_email', 'Receive game via email', 5465)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_frnd_10', 'Adoring', 5466)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_501_desc', 'For pirates everywhere', 5467)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wcandle_desc', 'Xmas tea light', 5468)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue*1_desc', 'Say hello to Nelly', 5469)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*7_name', 'Green Mode Armchair', 5470)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*4_name', 'Army Sleeping Bag', 5471)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*12_desc', 'Hip plastic furniture', 5472)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*8_name', 'Yellow Chair', 5473)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_508_name', 'The Spanish flag', 5474)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ad_note', 'Clicking this advertisement will open a new window', 5475)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_12_desc', 'skyscrapers at night', 5476)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ConnectionNotReady', 'Could not connect to the server', 5477)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*6_desc', 'Translucent beauty', 5478)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_splashplastic', 'SplashPlastic', 5479)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_4/0_desc', ' ', 5480)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_zoom_out.help', 'Zoom Out', 5481)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cafe_gold_name', 'The Oasis', 5482)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*9_desc', 'Red Silo Dining Chair', 5483)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_report_remove', 'Remove', 5484)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft_desc', 'Soft Wool Rug', 5485)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_19_name', 'Hole In The Wall', 5486)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*2_name', 'Glass stool', 5487)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree5_name', 'Christmas Tree 3', 5488)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*6_desc', 'Ancient and stately', 5489)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*3_desc', 'For our feathered friends', 5490)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_silo_one_name', 'Single Bed', 5491)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_lastvisit', 'Last Visit', 5492)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*2_desc', 'No trespassing, please!', 5493)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*4_name', 'Beige Mode Double Bed', 5494)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_53_name', 'Hockey Stick', 5495)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*0_name', 'Red Ice Cream Maker', 5496)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_help_5', 'http://%predefined%//footer_pages/privacy_policy.html', 5497)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table_name', 'Glass table', 5498)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*1_desc', 'High technology in a retro frame', 5499)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_help_4', 'http://%predefined%//footer_pages/privacy_policy.html', 5500)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_help_3', 'http://%predefined%//help/habbo_way.html', 5501)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cafe_ole_name', 'Cafe ole', 5502)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_help_2', 'http://%predefined%//help/faqs/index.html', 5503)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_13/0_desc', ' ', 5504)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_help_1', 'http://%predefined%//help/', 5505)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*1_name', 'Sport track straight', 5506)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.e1.info', 'There are %e1% players in front of you in the queue.', 5507)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('opening_hours_text_disabled', 'The game is shutting down really soon. To avoid confusion, purchasing of furniture, Thor Club and game tickets have been disabled, as well as playing games and furniture trading. Try again tomorrow when the game is open!', 5508)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_chatlog', 'See Chat Log >>', 5509)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*8_name', 'Purple Smoke Machine', 5510)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_37_desc', 'The games girlband. Dream on!', 5511)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t3_2', 'Hubun kiertuekalenteri 2002', 5512)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sandrug_name', 'Jamaican Sand Patch', 5513)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_dsk_name', 'Study Desk', 5514)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_small_table_armas_desc', 'Practical and beautiful', 5515)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.queue_full.alert', 'The queue for this room is full. Please try again later.', 5516)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*8_desc', 'To keep the rif raf out!', 5517)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('yes', 'Yes', 5518)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_den/0_desc', 'Has anyone seen my map?', 5519)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_511_desc', 'The flag of The Netherlands', 5520)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_5_name', 'Duck Poster', 5521)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_game_deleted', 'The Game has been deleted.', 5522)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*3_desc', 'Translucent beauty', 5523)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_518_name', 'The Welsh flag', 5524)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_22_desc', 'A chilly snowy scene', 5525)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_lessoptions', 'Less Options <<', 5526)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*8_name', 'Yellow Safe Minibar', 5527)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*2_desc', 'The power of movement', 5528)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('search', 'Search', 5529)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_13/0_desc', ' ', 5530)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*3_desc', 'Breathtaking bronze', 5531)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/4_name', 'Chess', 5532)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_4/0_desc', ' ', 5533)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_removerights_desc', 'Remove all rights to this room from other users.', 5534)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_29_name', 'Tinsel (gold)', 5535)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*1_name', 'Pink Oriental screen', 5536)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*9_name', 'Green Roller', 5537)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_armas_name', 'Hand-Woven Rug', 5538)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_NoNameSetForLogo', 'Please give a name to your logo', 5539)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_duck_desc', 'Every bather needs one', 5540)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('chat.curse_word', 'bobba', 5541)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_error1', 'Invalid voucher code.', 5542)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_error0', 'Technical error! Cannot redeem voucher.', 5543)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2004_desc', 'irie!', 5544)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*6_desc', 'Blue Area Armchair', 5545)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja_name', 'Bench', 5546)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar_name', 'Faux-Fur Bear Rug', 5547)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_txt_4', 'Privacy Policy', 5548)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_txt_3', 'The Thor Rules', 5549)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_txt_2', 'FAQ''s (Your Questions Answered)', 5550)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_txt_1', 'Help For New Thor Users', 5551)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*3_desc', 'Hip plastic furniture?', 5552)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_peeloscore', 'http://%predefined%//games/wobblesquabble', 5553)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_47_desc', 'Twinkle, twinkle', 5554)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_sms_win_orange', 'Orange SMS', 5555)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*4_desc', 'Two can perch comfortably', 5556)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rcandleset_name', 'Red Candles on a Plate', 5557)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*9_desc', 'Red Ice corner', 5558)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*6_name', 'Square Dining Table', 5559)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*1_desc', 'Available in a variety of colours', 5560)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_legotrophy_name', 'Basketball Trophy', 5561)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*4_desc', 'Beige Mode Single Bed', 5562)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_expert_desc', 'For the William Tells and Robin Hoods of Snow Storming.', 5563)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*1_name', 'Pink Faux-Fur Bear Rug', 5564)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_5/0_desc', ' ', 5565)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*2_desc', 'Cool cornering for your crib y0!', 5566)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen3_name', 'Gift', 5567)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('shopping_nocash', 'You don''t have enough Credits in your Wallet.\r Click ''OK'' to see the different ways of\rgetting Thor Credits.', 5568)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*3_desc', 'White Iced Sofa', 5569)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('photo_legend', 'Caption', 5570)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_expired', 'Your Thor Club membership has run out. You can join the club again by clicking the HC logo on the front view.\rMembers of Thor Club get priority access to the game (so you can always get in), rare furni and special guest room layouts. To see exactly what ', 5571)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood2_name', 'Sardines', 5572)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_gift_text', 'A new club gift has arrived. Please push OK if you want to receive it now. If you click cancel you will be asked again next time you log in to the game.', 5573)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_pws2', '24 hour access:', 5574)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*9_name', 'Red Iced Angle', 5575)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('human_trading', 'Trading', 5576)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_no_category', 'Your room has no category. Select one from the list.', 5577)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*1_name', 'Pink Fluffy Pillow', 5578)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*1_desc', 'Soft Wool Rug', 5579)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_pizza/0_desc', 'Pizza Palace', 5580)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_md_sofa_desc', 'A decent recliner', 5581)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1005_name', 'Johnny Squabble', 5582)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*7_desc', 'Rejuvenate your pixels!', 5583)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_jaggara_norja_desc', ' Soft Iced sofachair', 5584)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*4_name', 'Beige Mode Bardesk Corner', 5585)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('forgottenpw_whatyou', 'What''s your player called?', 5586)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_redhologram_desc', 'You''re her only hope...', 5587)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*8_desc', 'Ultimate coziness', 5588)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ConnectionDisconnected', 'Please reload Thor!\r\rIf this happens again, please wait a moment before reloading.', 5589)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_small_desc', 'For serving a stylish latte', 5590)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*3_desc', 'For nic naks and art deco books', 5591)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small_desc', 'For those random moments', 5592)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_open', 'Door open', 5593)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('log_problem_url', 'http://%predefined%//help/faqs/index.html', 5594)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_samovar_name', 'Russian Samovar', 5595)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_callforhelp', 'Call For Help HERE!', 5596)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_6/0_desc', ' ', 5597)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*6_desc', 'Translucent beauty', 5598)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hyacinth1_name', 'Pink Hyacinth', 5599)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hockey_light_desc', 'Set it off.', 5600)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*3_desc', 'Energy beams. No trespassers!', 5601)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_costs', '\x1 costs \x2 Credits', 5602)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*3_name', 'White Safe Minibar', 5603)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*4_name', 'Beige Bar Stool', 5604)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*8_desc', 'Yellow Mode Double Bed', 5605)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_use_allowed_chars', 'Use only these characters:', 5606)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*6_name', 'Large Coffee Table Blue', 5607)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_57_desc', 'Chinese calligraphy', 5608)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*1_name', 'Globe trophy', 5609)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*4_desc', 'Virtual vanilla rocks!', 5610)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_5_name', 'Snow Rookies Lobby', 5611)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain_desc', 'Available in a variety of colours', 5612)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_trad_one_name', 'Plain Single Bed', 5613)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_NameTooLong', 'Sorry, that username is too long!', 5614)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_hammock_name', 'Hammock', 5615)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rcandle_name', 'Red Candle', 5616)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_15/0_desc', ' ', 5617)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*b_desc', 'Available in a variety of colours', 5618)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*1_name', 'Sport goal tartan', 5619)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pudding_desc', 'Will you get the lucky sixpence?', 5620)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_intro_link', 'Learn more about Thor Club!', 5621)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_report_help', 'If the message you received was abusive or harassing, you can report it to the Moderators by clicking the Report button below. The player will be removed from your Friends'' List automatically when you report. If you want to remove a player from your Frien', 5622)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bartable_armas_name', 'Bardesk', 5623)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_tutorial_txt', 'Take The Thor Tour', 5624)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_NoNameSet', 'Check your Thor name.', 5625)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*2_desc', 'Black Area Gate', 5626)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*3_name', 'Silver Dragon Lamp', 5627)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*5_name', 'Pink Area Corner Shelf', 5628)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_privateRooms', 'Midgard', 5629)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_0_name', 'Snow Slingers Lobby', 5630)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_9_desc', 'do your bit for the environment', 5631)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_china_shelve_desc', 'To hold the mind''s treasures', 5632)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_age_check_note', 'Enter your birthday. You will need your birthday information when changing your password or email.', 5633)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_sunflower_name', 'Cut Sunflower', 5634)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*9_name', 'Red Area Gate', 5635)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*5_desc', 'Pink Area Coffee Table', 5636)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*5_desc', 'Pink Iced Sofachair', 5637)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*4_desc', 'Soft and tearproof!', 5638)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*6_name', 'Floor Rug', 5639)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*2_name', 'Blue Traffic Light', 5640)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_give_rights', 'Give rights', 5641)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_5/0_desc', ' ', 5642)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_paybycash_url', '(leave this empty if you don''t want to have this link displayed)', 5643)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wall_china_name', 'Dragon Screen', 5644)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*4_desc', 'Translucent beauty', 5645)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_desc', 'Beginner battle ball', 5646)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_noprofile', 'Thor Profile Not Found', 5647)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*5_desc', 'From deep inside the dragon caves', 5648)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_thir_3', 'Not thirsty', 5649)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_thir_2', 'Thirsty', 5650)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_thir_1', 'Parched', 5651)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*3_desc', 'Bronze trophy', 5652)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_thir_0', 'Gasping', 5653)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_polyfon_name', 'Bookcase', 5654)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_bday_note', 'Please enter your correct date of birth, this is important! You''ll need this information later on, if you want to change your password or e-mail.', 5655)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*4_name', 'Chair', 5656)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_maxvisitors', 'Choose maximum number of visitors', 5657)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_namedisp', 'Do you want your name to be displayed with the room?', 5658)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_confirmPlace', 'Are you sure?', 5659)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*3_desc', 'Roll out!', 5660)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*6_name', 'Blue Iced  bar desk', 5661)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_0_name', 'Snow Bombardiers Lobby', 5662)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*5_name', 'Pink Mode Bardesk Gate', 5663)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*3_name', 'White Area Sofa', 5664)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_valeduck_desc', 'He''s lovestruck', 5665)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_emergency_writeyour', 'Write your emergency Call for Help here:', 5666)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_halloween/0_desc', 'Something evil this way comes...', 5667)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_finalscores2', 'Game over!', 5668)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_finalscores1', 'Game over!', 5669)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_yukka_name', 'Yukka Plant', 5670)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*10_name', 'Chair', 5671)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_club_sofa_name', 'Club sofa', 5672)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_10_name', 'Lapland Poster', 5673)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*4_name', 'Glass sofa', 5674)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_donate_content', 'The other player has not put anything into the trade. Are you sure you want to give away your furni?', 5675)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*7_name', 'Green Silo Dining Chair', 5676)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_changeEmail', 'Change your email', 5677)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty_name', 'Plastic Pod Chair', 5678)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*11_name', 'Plastic Pod Chair', 5679)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg_name', 'Occasional Table', 5680)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*9_desc', 'Red Mode Sofa', 5681)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_basement_lobby/0_desc', 'A low level hang-out!', 5682)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_1_name', 'Free Game Lobby', 5683)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*4_name', 'Dark Ages Pillar', 5684)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*1_name', 'Bird Bath (grey)', 5685)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habbo_hand_next', '>>>', 5686)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_small_chair_armas_desc', 'Rustic charm at it''s best', 5687)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_7/0_desc', ' ', 5688)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*8_desc', 'Yellow Mode Bardesk', 5689)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_emperors/0_desc', 'Come pay your respects', 5690)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*5_desc', 'Puffy, soft and huge', 5691)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_duplicatesession', 'You are already logged in on another game! Log out before trying again.', 5692)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*1_desc', 'It''s both door and a shade!', 5693)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*0_desc', 'Block those rays!', 5694)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*4_desc', 'Hip plastic furniture', 5695)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_hidefull', 'Hide Full Rooms', 5696)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_online', 'online:', 5697)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*8_desc', 'Yellow Mode Bardesk Corner', 5698)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('tickets_info_2', 'With 20 tickets you can play the following Games:\r10 Battle Ball or\r20 Wobble Squabble or\r20 Lido Diving', 5699)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*8_name', 'Ultramarine Marquee', 5700)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('tickets_info_1', 'With 2 tickets you can play the following Games:\r1 Battle Ball or\r2 Wobble Squabble or\r2 Lido Diving', 5701)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_entercode', 'Enter code here:', 5702)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*4_name', 'Blue Water Bowl', 5703)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_35_name', 'The Babes 1', 5704)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*2_desc', 'Hip plastic furniture', 5705)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen_name', 'Gift', 5706)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_ownrooms_helptext', 'If you didn''t know, these are your rooms. Here you can modify your rooms or create new ones if you feel like it.', 5707)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_6', 'emergency_help', 5708)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_5', 'http://%predefined%//iot/go?lang', 5709)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_4', 'http://%predefined%//help/faqs', 5710)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_3', 'http://%predefined%//club/', 5711)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_2', 'http://%predefined%//iot/go?lang', 5712)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*9_name', 'Occasional Table', 5713)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_pointer_1', 'http://%predefined%//credits/', 5714)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_name', 'Floor Tiles', 5715)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*10_desc', 'Ultimate coziness', 5716)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*6_name', 'Black Monolith', 5717)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*2_name', 'Sport corner asphalt', 5718)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo_name', 'Armchair', 5719)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*3_desc', 'Hip plastic furniture', 5720)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_stand_name', 'Speaker''s Corner', 5721)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_8/0_desc', ' ', 5722)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*8_desc', 'Practical and convenient', 5723)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4_name', 'Plain Iced Auto Shutter', 5724)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('error_text', 'Error occured, press ''OK'' to restart program.\r\rPlease report bugs to:\rwww.habbohotel.com/habbo/en/help/contact/bugs/ \rSorry for the inconvenience.', 5725)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_10/0_desc', ' ', 5726)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('accept', 'Accept', 5727)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_tickets_title', 'Tickets', 5728)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_doorbell', 'Doorbell', 5729)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_20_name', 'Snowman Poster', 5730)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*0_name', 'White Roller', 5731)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('BuddyNotHere', 'Offline', 5732)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info', 'Welcome to the FRANK Infobus! FRANK advisors who know a lot about drugs, their effects and the risks involved, will be stepping aboard the Infobus to offer advice and support to any Habbo that wants to visit the bus. For more information click the link be', 5733)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_space_cafe/0_desc', 'Aviators and traders welcome', 5734)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_go_created', 'Join', 5735)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*5_desc', 'It''ll blow you away!', 5736)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*1_name', 'Duo trophy', 5737)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_prvrooms_notfound', 'Your search did not match any rooms', 5738)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info_url_2', 'http://www.talktofrank.com/', 5739)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info_url_1', 'http://%predefined%//help/infobus', 5740)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop_rumble_ii/0_desc', 'Are you ready?', 5741)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_ConnectionFailure', 'Disconnected', 5742)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*8_name', 'Yellow Area Occasional Table', 5743)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('opening_hours_text_closed', 'The game has been closed and will be open to the public again at %h%:%m%.', 5744)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_17/0_desc', ' ', 5745)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_giftflowers_desc', 'Guaranteed to stay fresh', 5746)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2002_name', 'Urho Kaleva Kekkonen', 5747)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*4_name', 'Beige Area Armchair', 5748)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_MessageFromAdmin', 'Message from Game Management:', 5749)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_6_name', 'Tournament Lobby', 5750)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*7_desc', 'Scary and scorching!', 5751)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*9_desc', 'Red Area Small Table', 5752)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.go_away', 'go away', 5753)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_2/0_desc', ' ', 5754)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_snowrug_desc', 'Winter wonderland', 5755)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*1_name', 'Round Dining Table', 5756)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*13_desc', 'Tuck it away', 5757)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_choosecolour', 'Choose Costume Colour', 5758)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_45_name', 'Skeleton', 5759)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_take_rights', 'Remove Rights', 5760)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('receivers', 'Receiver(s):', 5761)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_onemoment', 'Please wait, we are going to your room...', 5762)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*4_desc', 'Aquamarine Iced gate', 5763)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*7_name', 'Green Ice corner', 5764)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*15_name', 'Occasional Table', 5765)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*6_desc', 'Chill and wait your turn!', 5766)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*2_name', 'Black Mode Single Bed', 5767)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*3_desc', 'White Mode Bardesk', 5768)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_compose', 'Compose A Message', 5769)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tv_luxus_desc', 'Bang up to date', 5770)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon_desc', 'Tuck it away', 5771)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_header_teams', 'Teams', 5772)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_7/0_desc', ' ', 5773)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_CheckBirthday', 'Please check your birthday', 5774)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_length_trophymsg', 'Oops, your inscription is too long, so it won''t fit on the trophy. \rPlease type something shorter.', 5775)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster__name', 'Chinese Lacquer Sofa', 5776)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_triplecandle_name', 'Electric Candles', 5777)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('email', ' ', 5778)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*8_desc', 'Hip plastic furniture', 5779)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*5_name', 'Pink Solarium', 5780)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*2_desc', 'Black Mode Armchair', 5781)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*9_desc', 'Red Mode Bardesk Gate', 5782)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_30_name', 'Mistletoe', 5783)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*7_desc', 'Green Area Sofa', 5784)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*3_desc', 'Sleek and chic for each cheek', 5785)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_503_desc', 'There''s no holes in this...', 5786)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budget_one_name', 'Plain Single Bed', 5787)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*9_name', 'Red Mode Armchair', 5788)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*6_name', 'Purple Sleeping Bag', 5789)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1_name', 'Marzipan Man', 5790)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*14_desc', 'Aqua chair', 5791)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_text_spectate', 'You can watch this game', 5792)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_gobutton', 'Go', 5793)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_14_desc', 'a truly cunning design', 5794)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*8_desc', 'Translucent beauty', 5795)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*1_name', 'Pink Spaceship Door', 5796)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sport/0_desc', 'No pain, no gain.', 5797)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info_t', 'The big FRANK Infobus', 5798)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_emergency_explanation', 'What is an emergency? Extremely graphic language, racism, threats of real life violence, stealing accounts, sharing personal details, and trying to arrange meetings in real life. \r\rIf you witness any of these, send a Call for Help now. Warning: non emer', 5799)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*4_name', 'Glass stool', 5800)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_game/0_name', 'Battle Ball Arena', 5801)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*8_desc', 'All roads lead to Rome', 5802)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*1_name', 'Yellow Laser Door', 5803)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.dog.4', 'Mmmmm..', 5804)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.dog.3', 'hrum, umm, umm grrr', 5805)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('rotate_furniture', 'Rotate Furni', 5806)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.dog.2', 'slurp, slurp, slurp', 5807)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.dog.1', 'crunch, crunch mmmm', 5808)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*6_name', 'Blue Mode Double Bed', 5809)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*0_desc', 'As red as Rudolph''s nose', 5810)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.dog.0', 'hrum, hrum, crunch!', 5811)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_55_name', 'Tree on the beach', 5812)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_age', 'Age:', 5813)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*2_name', 'Green Ice Cream Maker', 5814)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_9/0_desc', ' ', 5815)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*3_desc', 'Recovered from Western Bobbaria', 5816)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_heart_name', 'Giant Heart', 5817)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hockey_score_name', 'Scoreboard', 5818)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*15_desc', 'Hip plastic furniture', 5819)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_cruddy_desc', 'Goodbye Bert...', 5820)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*15_desc', 'Hip plastic furniture', 5821)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_39_desc', 'The rock masters of virtual music', 5822)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_checking', 'Checking...', 5823)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_tbl_desc', 'Perfect for banquets', 5824)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_mark_emergency', 'Upgrade', 5825)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*2_name', 'Fish trophy', 5826)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_linkstitle', 'Full version of the documents:', 5827)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_messenger', 'Console', 5828)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_desc', 'Intermediate battle ball!', 5829)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_513_desc', 'Aussies rule!', 5830)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_7_name', 'Hammer Cabinet', 5831)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_photo_desc', 'Photo from Thor', 5832)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_dirty_duck_pub_name', 'The Dirty Duck Pub', 5833)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*5_desc', 'Translucent beauty', 5834)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*3_name', 'White Area Coffee Table', 5835)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_24_desc', 'Following the star!', 5836)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*2_name', 'Pink Inflatable Chair', 5837)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_expand', 'Expand Window', 5838)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*4_desc', 'The power of movement', 5839)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('BuddyRequesta', 'Friend Request(s)', 5840)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_med_desc', 'For larger gatherings', 5841)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_12/0_desc', ' ', 5842)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.cat.4', 'Purrrrr oow', 5843)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.cat.3', 'Purrrrrrrrrr', 5844)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.cat.2', 'muew..muew', 5845)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.cat.1', 'meow...meOW', 5846)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.generic.cat.0', 'meow', 5847)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*2_name', 'Glass chair', 5848)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*3_name', 'Aqua Oriental Screen', 5849)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_polyfon_name', 'Dining Chair', 5850)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_menorah_name', 'Menorah', 5851)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('password', 'Password:', 5852)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_time_counter', 's', 5853)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*1_name', 'Gold trophy', 5854)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('open', 'Open', 5855)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('GoInside', 'Go >>', 5856)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fireplace_armas_name', 'Fireplace', 5857)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_message', 'Message:', 5858)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2006_desc', 'He is the magic player', 5859)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*8_desc', 'Yellow Area Armchair', 5860)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_girl_one_desc', 'Snuggle down in princess pink', 5861)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck2_name', 'Dead Duck 2', 5862)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('log_problem_link', 'Read FAQ''s', 5863)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_exit', 'Exit In Normal Clothes', 5864)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*1_desc', 'Hip plastic furniture', 5865)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*5_desc', 'Hip plastic furniture', 5866)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_state_started', 'This Game has already started...', 5867)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_49_desc', 'All that glitters...', 5868)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_statue_desc', 'Watch out for those arrows!', 5869)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*6_desc', 'Two can perch comfortably', 5870)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_4/0_desc', ' ', 5871)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('callhelp_example', 'Example: How do I stack Furni?', 5872)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*8_name', 'Square Dining Table', 5873)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_024', 'Cat Burglar', 5874)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_023', 'Indoor Alley Cat', 5875)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_022', 'Matted Moggy', 5876)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ticket_name', 'Big Ticket Bundle', 5877)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_021', 'Fabulous Feline', 5878)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_020', 'Caterwaul Kitty', 5879)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*3_desc', 'Available in a variety of colours', 5880)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*6_desc', 'Blue Mode Single Bed', 5881)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*3_name', 'Yellow Bear Rug', 5882)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*7_name', 'Green Mode Sofa', 5883)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_armas_name', 'Bookcase', 5884)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*4_desc', 'Cool cornering for your crib y0!', 5885)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*15_desc', 'Hip plastic furniture', 5886)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen5_name', 'Gift', 5887)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*5_desc', 'Pink Iced Sofa', 5888)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1000_desc', 'The Noble and Silver Show', 5889)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_pledgelink', 'Game rules', 5890)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_china_table_name', 'Chinese Lacquer Table', 5891)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3_name', 'Hatch (Lockable)', 5892)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo_name', 'Dining Chair', 5893)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*6_name', 'Blue Mode Bardesk', 5894)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_019', 'Bobcat Wailer', 5895)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_018', 'Trusting Tabby', 5896)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*3_name', 'Turquoise Satin Pillow', 5897)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_017', 'Furry Friend', 5898)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_016', 'Curiousity - The Return!', 5899)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_015', 'Haughty House Pet', 5900)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*3_desc', 'Soft Wool Rug', 5901)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_014', 'Bushy Bobtail', 5902)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_013', 'Felis Catus Allergicus', 5903)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_012', 'Freckled Feral', 5904)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_pleasewait', 'Please wait a second...', 5905)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_9/0_desc', ' ', 5906)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_011', 'Egyptian Angora', 5907)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*9_desc', 'Rejuvenate your pixels!', 5908)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('tickets_button_info_2', 'Stuff you can with these 20 tickets', 5909)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_010', 'Wannabe Wildcat', 5910)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('tickets_button_info_1', 'Stuff you can do with these 2 tickets', 5911)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*2_name', 'Square Dining Table', 5912)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*6_name', 'Blue Mode Bardesk Corner', 5913)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_floortile_desc', 'In Variety of Colours', 5914)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_deli/0_desc', ' ', 5915)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('trading_offers', 'offers:', 5916)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*5_desc', 'For nic naks and art deco books', 5917)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_differentmessagemodes', 'Different Messages', 5918)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_009', 'Scaredy Kat', 5919)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_008', 'Mad Mouser', 5920)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_007', 'Burmese Buddy', 5921)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_legocourt_desc', 'Line up your slam dunk', 5922)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_006', 'Titchy Tiger', 5923)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_005', 'Cat Astroflea', 5924)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_004', 'Soft-Toed Sneaker', 5925)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_003', 'Hidden Clause', 5926)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_002', 'Lesser Spotted Longhair', 5927)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_001', 'Purr-Sian', 5928)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_1_000', 'Sleepy Siamese', 5929)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_letmove', 'Let other people move your furniture and place their own. (Furniture cannot be stolen.)', 5930)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon_girl_desc', 'Think pink', 5931)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*8_desc', 'Translucent beauty', 5932)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_choose_numteams', 'Choose number of Teams:', 5933)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*5_desc', ' Recovered from Roswell', 5934)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*1_name', 'Plastic Pod Chair', 5935)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*5_name', 'Pink Safe Minibar', 5936)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_xmas_screen_desc', 'Ho Ho Ho!', 5937)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_park/0_desc', 'Go for a stroll outdoors', 5938)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*6_name', 'Blue Bar Stool', 5939)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_girl', 'Girl', 5940)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*8_name', 'Large Coffee Table Yellow', 5941)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*3_name', 'Globe trophy', 5942)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*6_desc', 'Virtual vanilla rocks!', 5943)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_7_name', 'Snow Rookies Lobby', 5944)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_owner', 'Owner:', 5945)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_basic_desc', 'Pura series 404 shelves', 5946)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*3_name', 'Purple Powered Fan', 5947)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chess', 'Chess', 5948)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*3_name', 'Sport goal grass', 5949)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*2_desc', 'Shiny silver', 5950)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reply', 'Reply', 5951)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_YouAreBanned_T', 'A Moderator kicked you out of the room.', 5952)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hotel_kitchen_name', 'Kitchen', 5953)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_purse_subscribe', 'http://%predefined%//credits/?', 5954)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_start_9', 'Team sizes can only differ by one player. This Game cannot start!', 5955)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*4_desc', 'Beige Area Gate', 5956)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*5_name', 'Elf Green Dragon Lamp', 5957)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*7_name', 'Green Area Corner Shelf', 5958)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*2_name', 'Champion trophy', 5959)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_2_name', 'Snow Slingers Lobby', 5960)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*1_desc', 'Available in a variety of colours', 5961)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_roomkick', 'Room Kick', 5962)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_habboname', 'Thor name:', 5963)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_testimonials', 'What players say about Splash >>', 5964)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_girl_name', 'Double Bed', 5965)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_picnic/0_name', 'Picnic Garden', 5966)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*7_desc', 'Green Area Coffee Table', 5967)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*7_desc', 'Green Iced Sofachair', 5968)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*6_desc', 'Soft and tearproof!', 5969)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*8_name', 'Floor Rug', 5970)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*2_name', 'Black Iced gate', 5971)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*4_name', 'Yellow Traffic Light', 5972)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('loading_project', 'Loading Thor...', 5973)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_yell_desc', 'In a choice of colours', 5974)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_error_passwordtooshort', 'The password is too short.', 5975)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo2_desc', 'Stylish sectioning', 5976)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*6_desc', 'Translucent beauty', 5977)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*7_desc', 'Add an exotic touch to your room', 5978)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_post.it.vd_desc', 'Heart stickies', 5979)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_heartsofa_desc', 'Perfect for snuggling up on', 5980)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_mark_normal', 'Downgrade', 5981)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*6_name', 'Chair', 5982)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('opening_hours_text_opening_time', 'The game will open again at %h%:%m%. We look forward to welcoming you back!', 5983)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_0/0_desc', ' ', 5984)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*5_desc', 'Roll out!', 5985)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*8_name', 'Yellow Iced  bar desk', 5986)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_2_name', 'Snow Bombardiers Lobby', 5987)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roommatic_modify_size', 'Room size: %tileCount% tiles', 5988)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*7_name', 'Green Mode Bardesk Gate', 5989)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*5_name', 'Pink Area Sofa', 5990)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_501_name', 'Jolly Roger', 5991)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_rooftop_rumble_ii_name', 'Rooftop Rumble II', 5992)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wcandle_name', 'White Candle', 5993)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue*1_name', 'Silver Elephant', 5994)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*2_desc', 'Black Silo Dining Chair', 5995)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*12_name', 'Chair', 5996)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_12_name', 'Skyline Poster', 5997)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*6_name', 'Glass sofa', 5998)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_buddylimit_requester', 'Friend could not be added. The request sender can not have anymore friends.', 5999)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_6', 'I need emergency help from a Moderator.', 6000)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_5', 'I have a question and it’s none of the above.', 6001)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_4', 'How do I become a moderator?', 6002)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*9_name', 'Red Silo Dining Chair', 6003)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_3', 'How do I join Thor Club?', 6004)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_free_name', 'Playing free for all game', 6005)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_2', 'How do I reset my password?', 6006)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_option_1', 'How do I get Coins?', 6007)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_6/0_desc', ' ', 6008)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft_name', 'Soft Wool Rug', 6009)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_youdonthavebuddies', 'You have no Friends on your list.\rYou can send Friend Requests using\rthe ''search'' button.', 6010)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cafe_ole/0_desc', 'Tea for two?', 6011)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_3_name', 'Free Game Lobby', 6012)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*3_name', 'Bird Bath (blue)', 6013)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*6_name', 'Terracotta Pillar', 6014)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_beauty_salon_loreal/0_desc', 'No Pixel Surgery, only natural make-ups!', 6015)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*2_name', 'White Road Barrier', 6016)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ham2_desc', 'Looks like you''re too late!', 6017)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*7_desc', 'For Stars only!', 6018)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_orient_name', 'Club Orient', 6019)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*3_desc', 'It''s both door and a shade!', 6020)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*2_desc', 'Block those rays!', 6021)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_save.help', 'Save & Print Photo', 6022)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('loading', 'Loading...', 6023)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*6_desc', 'Hip plastic furniture', 6024)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*1_name', 'Yellow Smoke Machine', 6025)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_37_name', 'The Babes 3', 6026)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*4_desc', 'Hip plastic furniture', 6027)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_search_habbo_profilematch', 'Profile match -', 6028)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_price1', '25', 6029)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_globe_desc', 'It''s all white..', 6030)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_max_pet_limit', 'Too many pets in the room!', 6031)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('log_problem_title', 'Problems Connecting', 6032)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_small_table_armas_name', 'Occasional Table', 6033)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('forgottenpw', 'Forgotten your password?', 6034)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*8_name', 'Security', 6035)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habburger''s/0_desc', 'Get food here!', 6036)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('openhrs_title', 'We are closing the game', 6037)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_ice_cafe/0_desc', 'Come here to chill', 6038)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_511_name', 'The Dutch flag', 6039)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*2_desc', 'Black Iced Sofachair', 6040)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*5_desc', 'Hip plastic furniture', 6041)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_alphabetical', 'Alphabetical Order', 6042)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*3_name', 'Glass table', 6043)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_22_name', 'Winter Wonderland', 6044)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*3_desc', 'Let''s get sporty!', 6045)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*2_name', 'Red Roller', 6046)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*7_desc', 'It''ll blow you away!', 6047)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_thanks_3', 'When you get your card, you''ll need to activate it (details on how to are included with it), and then you can start buying Credits.', 6048)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_readterms_alert', 'You have to read the Terms and Conditions\r(scroll to the bottom of the text).', 6049)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*3_name', 'Duo trophy', 6050)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb*1_desc', 'A honey-hued glow', 6051)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_thanks_2', 'yours will arrive in the post shortly.', 6052)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*3_desc', 'White Area Occasional Table', 6053)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_thanks_1', 'Thanks for applying for a Splash Plastic card -', 6054)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_stuff_store', 'Catalogue purchase', 6055)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_currentPassword', 'Current password:', 6056)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_duck_name', 'Rubber Duck', 6057)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_donate_ok', 'Give away my furni', 6058)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_error_alert', 'ERROR!', 6059)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2004_name', 'Rasta Poster', 6060)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*6_name', 'Blue Area Armchair', 6061)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_40_desc', 'The one and only. Adore her!', 6062)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_8_name', 'Tournament Lobby', 6063)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*9_desc', 'Scary and scorching!', 6064)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_pickandreply', 'Pick and reply', 6065)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_1/0_desc', ' ', 6066)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_haventGotHabbo', 'Haven''t got an user yet?', 6067)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*2_desc', 'Black Ice corner', 6068)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*3_name', 'Round Dining Table', 6069)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_47_name', 'Small silver star', 6070)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*4_name', 'Aquamarine Bench', 6071)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*6_desc', 'Blue Iced gate', 6072)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*9_name', 'Red Ice corner', 6073)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_getsplash', 'Get Splash Plastic now >>', 6074)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*1_name', 'Doormat', 6075)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*4_name', 'Beige Mode Single Bed', 6076)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_letothersmove', 'Let other people move and leave furniture in the room.', 6077)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*2_name', 'Black Iced Angle', 6078)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_needpermission', 'You need your parent or guardian''s permission to spend time in Thor.', 6079)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*3_name', 'White Iced Sofa', 6080)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_submit_arrows', 'Submit >>', 6081)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('locked', 'Locked (visitors have to ring bell)', 6082)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_back_to_credits', 'Back To Purse', 6083)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*1_name', 'Soft Wool Rug', 6084)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_md_sofa_name', 'MD Sofa', 6085)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*7_name', 'Green Solarium', 6086)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_jaggara_norja_name', 'Iced Sofachair', 6087)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*4_desc', 'Beige Mode Armchair', 6088)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*1_desc', 'Ultimate coziness', 6089)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*9_desc', 'Red Area Sofa', 6090)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*5_desc', 'Sleek and chic for each cheek', 6091)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_505_desc', 'The Canadian flag', 6092)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_name', 'Room name:', 6093)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_update_text2', 'Only change them when you want to make sure that nobody can know or guess your password.', 6094)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modify', 'Modify', 6095)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_2/0_desc', ' ', 6096)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare_desc', 'Hip plastic furniture', 6097)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_club_habbo', 'Thor Club payment', 6098)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_redhologram_name', 'Holo-girl', 6099)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*8_name', 'Yellow Sleeping Bag', 6100)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*16_desc', 'Hip plastic furniture', 6101)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_small_name', 'Small Coffee Table', 6102)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*3_name', 'White Bookcase', 6103)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small_name', 'Occasional Table', 6104)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_16_desc', 'high security for your room', 6105)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree2_desc', 'Old Christmas Tree', 6106)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('previous', 'Previous', 6107)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*6_name', 'Glass stool', 6108)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('shopping_costs', 'XX costs XX Credit(s).\rJust click ''buy'' once, it''ll appear shortly.', 6109)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hockey_light_name', 'Lert', 6110)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_50_desc', 'flap, flap, screech, screech...', 6111)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*3_name', 'Jade Sci-Fi Port', 6112)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_11/0_desc', ' ', 6113)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_error', 'Notice!', 6114)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_cancel', 'Cancel', 6115)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*8_name', 'Yellow Mode Double Bed', 6116)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_preparing', '...Preparing room', 6117)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_57_name', 'Calligraphy Poster', 6118)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_kickuser', 'Kick User', 6119)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*4_name', 'Pink Ice Cream Maker', 6120)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_catalog', 'Catalogue - for furnishing your room', 6121)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*5_desc', 'From the unknown depths of space', 6122)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain_name', 'Doormat', 6123)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_nature', 'Nature:', 6124)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_start', 'Start Game!', 6125)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_pet_unacceptable', 'Sorry, that name is unacceptable to Thor Management!', 6126)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*b_name', 'Floor Rug', 6127)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pudding_name', 'Christmas Pudding', 6128)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard_desc', 'Available in a variety of colours', 6129)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2_desc', 'take pride in your veg!', 6130)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_thirsty', 'Thirst:', 6131)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_text3', 'Buy more and pay less: 6 Months (186 days) of Thor Club cost only 105 Credits. You have %credits% credits in your Purse.\r\r After buying the membership, you will immediately be part of the Thor VIP Community.', 6132)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_forgottenPassword', 'Forgotten your password?', 6133)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_text2', 'Buy more and pay less: 3 Months (93 days) of Thor Club cost only 60 Credits. You have %credits% credits in your Purse.\r\r After buying the membership, you will immediately be part of the Thor VIP Community.', 6134)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*2_name', 'Black Area Gate', 6135)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_515_desc', 'Waved by Swedes everywhere', 6136)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_text1', '1 Thor Club Month (31 days) costs 25 Credits. You have %credits% Credits in your Purse.\r\r After buying the membership, you will immediately be part of the Thor VIP Community.', 6137)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_1/0_desc', ' ', 6138)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_9_name', 'Rainforest Poster', 6139)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_china_shelve_name', 'Chinese Lacquer Bookshelf', 6140)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_reject_all', 'Reject All', 6141)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/1_desc', 'It''s one-on-one for five in a row', 6142)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*7_desc', 'Translucent beauty', 6143)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_link_join', 'Join Team', 6144)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*5_name', 'Pink Area Coffee Table', 6145)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chooseside', 'Choose your side', 6146)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*5_name', 'Pink Iced Sofachair', 6147)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_26_desc', 'Hung yours up yet?', 6148)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*4_name', 'Ocean Inflatable Chair', 6149)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_NameAlreadyUse', 'That name is already being used', 6150)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_header', 'The Tool', 6151)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*6_desc', 'The power of movement', 6152)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_check_mail', 'Email', 6153)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*4_name', 'Glass chair', 6154)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*5_name', 'Shadow Screen', 6155)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy7*3_name', 'Bronze trophy', 6156)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorB_desc', 'Narnia this way!', 6157)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.jump', 'jump', 6158)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2008_desc', 'For serious bubblers', 6159)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_searchfor', 'Search:', 6160)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_hand', 'Hand - items you own', 6161)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*3_name', 'White Iced Auto Shutter', 6162)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_valeduck_name', 'Valentine''s Duck', 6163)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_birthdayformat_update', 'Birthday (dd.mm.yyyy)', 6164)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*3_desc', 'Hip plastic furniture', 6165)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*7_desc', 'Hip plastic furniture', 6166)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*8_desc', 'Two can perch comfortably', 6167)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*2_desc', 'Black Mode Sofa', 6168)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_3/0_desc', ' ', 6169)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*5_desc', 'Available in a variety of colours', 6170)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*8_desc', 'Yellow Mode Single Bed', 6171)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*9_name', 'Red Mode Sofa', 6172)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_0_name', 'Beginner', 6173)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*6_desc', 'Cool cornering for your crib y0!', 6174)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_button_1_period', 'Buy 1 >>>', 6175)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*7_desc', 'Green Iced Sofa', 6176)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_general_infolink', 'More Info About Thor Club >>', 6177)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1002_desc', 'aw, bless...', 6178)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_title', 'Informing your parents', 6179)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_header_page', 'Page', 6180)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_small_chair_armas_name', 'Stool', 6181)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('partner_registration_text', 'Click the link to finish your registration. When you have finished the registration click OK to continue to the game.', 6182)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*8_name', 'Yellow Mode Bardesk', 6183)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_den_name', 'The Den', 6184)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*5_name', 'Black Leather Pillow', 6185)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*2_desc', 'it''s bouncy-tastic', 6186)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*1_name', 'Pink marquee', 6187)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_habbo.bottombar.text.member', 'Thor Club', 6188)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*5_desc', 'Soft Wool Rug', 6189)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_privacypledge', 'http://%predefined%//footer_pages/privacy_policy.html', 6190)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*0_name', 'Green Parasol', 6191)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*4_name', 'Square Dining Table', 6192)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.d.info', 'There are %d% players in front of you in the queue.', 6193)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*8_name', 'Yellow Mode Bardesk Corner', 6194)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_logout_timeout', 'http://%predefined%//account/disconnected?reason', 6195)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_fullbutton', 'Full', 6196)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*7_desc', 'For nic naks and art deco books', 6197)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*2_name', 'Occasional Table', 6198)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_status_title', 'You are currently a member of Thor Club.', 6199)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_delroom3', 'Room deleted!', 6200)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_delroom2', 'Are you sure you want to delete this room? All the furniture left in it will also be deleted.', 6201)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_delroom1', 'If you want to save the furniture in this room, move it to the giant hand before you continue.', 6202)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_helpbutton', 'More about vouchers >>', 6203)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('camera_dialog_open', 'Shoot', 6204)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*10_name', 'Khaki Sleeping Bag', 6205)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*3_desc', 'For larger gatherings', 6206)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*7_desc', 'Energy beams. No trespassers!', 6207)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_state_created', 'Waiting for players..', 6208)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_general_daysleft', 'Number of HC days left', 6209)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*3_name', 'Plastic Pod Chair', 6210)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*8_name', 'Yellow Bar Stool', 6211)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*8_desc', 'Virtual chocolate rocks!', 6212)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_tour', ' Guided Tour', 6213)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('update_email_suggest', 'Thor security supervisor requests you to update your email', 6214)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_9_name', 'Snow Rookies Lobby', 6215)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*5_name', 'Yellow Powered Fan', 6216)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('retype_password', 'Retype Password:', 6217)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_confirm', 'Yeah, it is done...', 6218)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_console', 'Console', 6219)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_unignore', 'Listen', 6220)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_recipients', 'Recipient(s)', 6221)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_shrink', 'Minimize Window', 6222)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_vouchers_helpurl', 'http://%predefined%//help/faqs/index.html', 6223)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_getfriendrequest_2', 'If you accept this invitation (s)he will be added to your Friends List. Then you can send messages to each other.', 6224)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_getfriendrequest_1', 'has asked you to become his/her Friend.', 6225)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_norja_desc', 'Soft iced sofachair', 6226)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*0_desc', 'Scary & Scorching!', 6227)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*2_desc', 'Black Area Corner Shelf', 6228)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_roomnfo_hd_own', 'Own Rooms', 6229)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_giftflowers_name', 'Vase of Flowers', 6230)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hallway/0_desc', 'Roam the Hallways', 6231)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_ignore', 'Ignore', 6232)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*6_desc', 'Blue Area Gate', 6233)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*7_name', 'Sky Dragon Lamp', 6234)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*9_name', 'Red Area Small Table', 6235)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_addtofavourites', 'Add to favourites', 6236)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_4_name', 'Snow Slingers Lobby', 6237)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*2_desc', 'Shiny silver', 6238)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*3_desc', 'Available in a variety of colours', 6239)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_snowrug_name', 'Snow Rug', 6240)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall_name', 'Cunning Fox Gamehall', 6241)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*13_name', 'Corner Cabinet/Desk', 6242)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_zoom_in.help', 'Zoom In', 6243)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*9_desc', 'Red Area Coffee Table', 6244)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.beg.dog.2', '*whimpers *', 6245)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_intermediate_3/0_desc', ' ', 6246)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*9_desc', 'Red Iced Sofachair', 6247)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*8_desc', 'Soft and tearproof!', 6248)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*4_name', 'Aquamarine Iced gate', 6249)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_status_text', 'Here you can see your Thor Club membership status, number of elapsed months, pre-ordered months and status of the ongoing month.', 6250)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1*1_desc', 'Crunchy Dog Treat', 6251)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*6_name', 'Red Traffic Light', 6252)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_battles_turn', 'TURN', 6253)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*3_name', 'White Mode Bardesk', 6254)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_shelf_desc', 'Translucent beauty', 6255)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*8_desc', 'Translucent beauty', 6256)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*9_desc', 'Add an exotic touch to your room', 6257)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tv_luxus_name', 'Digital TV', 6258)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*1_desc', 'Hip plastic furniture', 6259)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon_name', 'Corner Cabinet/Desk', 6260)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*3_desc', 'White Iced bar desk', 6261)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hallway_ii/0_desc', 'Roam more of the Hallways', 6262)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*2_desc', 'Black Mode Bardesk Gate', 6263)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja_desc', 'Sleek and chic for each cheek', 6264)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja_desc', 'Soft iced sofachair', 6265)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_msgs', 'msgs', 6266)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_lido_ii_name', 'Lido II', 6267)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*8_name', 'Chair', 6268)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*7_desc', 'Roll out!', 6269)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_4_name', 'Snow Bombardiers Lobby', 6270)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*2_name', 'Black Mode Armchair', 6271)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*9_name', 'Red Mode Bardesk Gate', 6272)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*7_name', 'Green Area Sofa', 6273)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*3_name', 'White Chair', 6274)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_503_name', 'The Swiss flag', 6275)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*4_desc', 'Beige Silo Dining Chair', 6276)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*14_name', 'HC chair', 6277)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_14_name', 'Fox Poster', 6278)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*8_name', 'Glass sofa', 6279)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sport/0_name', 'The Power Gym', 6280)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*1_desc', 'Ancient and stately', 6281)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_bs_miss', 'Miss:', 6282)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_5_name', 'Free Game Lobby', 6283)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_list_full', 'Your friends list is full, you can''t add new friends until you delete some. \r\The maximum number of friends you can have, is %mylimit% players. Members of Thor Club can have up to %clublimit% friends on their list.', 6284)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*8_name', 'Roman Pillar', 6285)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_trad_desc', 'Sweet dreams for two', 6286)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_521_desc', 'The flag of Brazil', 6287)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck_desc', 'Blood, but no guts', 6288)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_button_3_period', 'Buy 6 >>>', 6289)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*9_desc', 'Puffy, soft and VERY fluffy!', 6290)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_areYouSurePlace', 'Warning! If you put something down in this room you will not be able to pick it up again.', 6291)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*5_desc', 'It''s both door and a shade!', 6292)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*0_name', ' Festive Fan', 6293)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*8_desc', 'Hip plastic furniture', 6294)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*3_name', 'Alien Artifact # 3007', 6295)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*1_desc', 'Aqua unlimited', 6296)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_32_desc', 'The Auspicious One', 6297)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*15_name', 'Occasional Table', 6298)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_cruddy_name', 'Aloe Vera', 6299)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*15_name', 'Occasional Table', 6300)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('callhelp_writeyour', 'Write your question about Thor here:', 6301)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_39_name', 'Screaming Furnies', 6302)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*6_desc', 'Hip plastic furniture', 6303)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_mammoth/0_desc', 'Monumental and magnificent. For Thor Club members only.', 6304)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_showfull', 'Show Full Rooms', 6305)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hc_tbl_name', 'Nordic Table', 6306)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*3_desc', 'There out of this world!', 6307)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_changesubscr', 'Change subscription', 6308)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1_desc', 'Looks squishy, but isn''t', 6309)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_513_name', 'The Australian flag', 6310)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva/1_desc', 'Strut your funky stuff', 6311)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*4_desc', 'Aquamarine Iced Sofachair', 6312)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*7_desc', 'Hip plastic furniture', 6313)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_photo_name', 'Photo', 6314)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize2_desc', 'Nice and shiny', 6315)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bus.full_msg', 'The FRANK bus is full at the moment, please come back later or visit the FRANK page below for more information.', 6316)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*5_name', 'Glass table', 6317)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_month', 'Month', 6318)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_adl2', 'Address Line 2', 6319)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_24_name', 'Three Wise Men Poster', 6320)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_adl1', 'Address Line 1', 6321)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('opening_hours_title', 'Maintenance', 6322)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*4_name', 'Gold Roller', 6323)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_gate_park/0_desc', ' Follow your path...', 6324)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wcandleset_desc', 'Simple but stylish', 6325)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_polyfon_med_name', 'Large Coffee Table', 6326)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*9_desc', 'It''ll blow you away!', 6327)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('name', 'name:', 6328)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*5_desc', 'Pink Area Occasional Table', 6329)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_yell_desc', 'Loo Seat', 6330)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon_desc', 'Comfort for stylish couples', 6331)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_bottombar_text2', '(....)', 6332)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_bottombar_text1', 'Loading', 6333)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_blocked', 'A person under 11 years of age has tried to register from this machine recently.\rRegistration will not be possible for two hours.', 6334)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('chatlog.url', 'https://theallseeingeye.sulake.com/ase/habbo/uk/housekeeping/extra/hobba/chatlog.action?useFilter', 6335)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_kattoterassi/0_desc', 'When push comes to shove...', 6336)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_0/0_desc', ' ', 6337)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2006_name', 'DJ Throne', 6338)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*8_name', 'Yellow Area Armchair', 6339)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_nextround', 'Next game...', 6340)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_alert_furni_limit', 'This room has the maximum amount of Furni.', 6341)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_42_desc', 'Not something you want to run into', 6342)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_girl_one_name', 'Single Bed', 6343)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm2_desc', 'I wooden go there', 6344)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_finalscores', 'Final Standings:', 6345)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_desc', 'Expert battle ball!', 6346)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roommatic_hc_members_only', 'Thor Club Members Only', 6347)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_own_hd', 'Your Rooms.', 6348)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*4_desc', 'Aquamarine Ice corner', 6349)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*1_name', 'Occasional Table', 6350)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*5_name', 'Round Dining Table', 6351)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_49_name', 'Large silver star', 6352)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_statue_name', 'Cupid Statue', 6353)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*6_name', 'Blue Bench', 6354)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_chess_start', 'Start Over', 6355)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*8_desc', 'Yellow Iced gate', 6356)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_removerights', 'Reset', 6357)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*3_name', 'Doormat', 6358)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*6_name', 'Blue Mode Single Bed', 6359)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_19/0_desc', ' ', 6360)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_park_name', 'Thor Gardens', 6361)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_search_hd', 'Search rooms by player name or room name.', 6362)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*4_name', 'Aquamarine Iced Angle', 6363)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*15_name', 'Occasional Table', 6364)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*5_name', 'Pink Iced Sofa', 6365)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1000_name', 'Comedy Poster', 6366)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*2_desc', 'Rejuvenate your pixels!', 6367)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_cinema_name', 'Cinema', 6368)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_dusty_lounge_name', 'Dusty Lounge', 6369)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_stand_polyfon_z_desc', 'Tidy up', 6370)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_back_arrows', '<< Back', 6371)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*3_name', 'Soft Wool Rug', 6372)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('doorbell_rings', 'Rings the doorbell - Open the door?', 6373)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*9_name', 'Red Solarium', 6374)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*6_desc', 'Blue Mode Armchair', 6375)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*3_desc', 'Ultimate coziness', 6376)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*7_desc', 'Sleek and chic for each cheek', 6377)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_507_desc', 'The French flag', 6378)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.nest', 'sleep', 6379)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_banreason', 'Ban Reason:', 6380)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_floortile_name', 'Floor Tile', 6381)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*5_name', 'Pink Bookcase', 6382)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_18_desc', 'beautiful reproduction butterfly', 6383)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_legocourt_name', 'Basketball Court', 6384)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree4_desc', 'Any presents under it yet?', 6385)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_hold', 'Wait a second...\rLoading room...', 6386)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon_girl_name', 'Armchair', 6387)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_habbocake_desc', 'Save me a slice!', 6388)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('int_credits', 'Credits', 6389)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*8_name', 'Glass stool', 6390)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*3_desc', 'White Mode Double Bed', 6391)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_52_desc', 'whack that ball!', 6392)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_choose_gamefield', 'Choose Snow Arena:', 6393)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*5_name', 'Security Fence', 6394)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_intro_header', 'Welcome to Thor Club, the members-only club that all VIP players belong to!', 6395)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_0_name', 'Snow Rookies Lobby', 6396)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_waitop', 'WAITING FOR THE OPPONENT', 6397)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_xmas_screen_name', 'Lappland Greetings', 6398)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*6_name', 'Ochre Ice Cream Maker', 6399)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_note_title', 'Warning!', 6400)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*7_desc', 'High technology in a retro frame', 6401)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square_desc', 'Hip plastic furniture', 6402)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.cat.2', '*munch, munch*', 6403)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.cat.1', 'lap, lap, lap, lap', 6404)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_basic_name', 'Pura Phelves', 6405)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.eat.cat.0', 'mmm...thumm, thumm', 6406)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('callhelp_explanation', 'Do you have a question about Thor that isn''t covered in the FAQ''s?\r\r Please Note:  If you ask a question that''s covered in the FAQ, your question may not be answered.', 6407)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_emergency_sent', 'Your Call for Help has been sent.', 6408)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy2*2_name', 'Duck trophy', 6409)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_nocredits', 'You need Credits to play a Game!', 6410)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_hallway_ii_name', 'Hallway II', 6411)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_14/0_desc', ' ', 6412)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_4_desc', 'fake of course!', 6413)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_title_bouncingBall', 'Battle Ball', 6414)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_parentemail_moreinfo', 'More information:', 6415)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_5/0_desc', ' ', 6416)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*4_name', 'Beige Area Gate', 6417)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_extend_failed', 'Sorry, we were unable to process the purchase. No Credits were charged!', 6418)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_517_desc', 'Where''s your kilt?', 6419)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_mocchamaster_desc', 'Wake up and smell it!', 6420)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*7_desc', 'Totally shatter-proof!', 6421)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*1_name', 'Floor Rug', 6422)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_day', 'Day', 6423)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/3_desc', 'Are you the new Deep Blue?', 6424)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*9_desc', 'Translucent beauty', 6425)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*7_name', 'Green Area Coffee Table', 6426)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*7_name', 'Green Iced Sofachair', 6427)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_28_desc', 'A touch of festive sparkle', 6428)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_lido/0_desc', 'Dive right in!', 6429)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*6_name', 'Violet Inflatable Chair', 6430)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*0_desc', 'Add an exotic touch to your room', 6431)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*8_desc', 'The power of movement', 6432)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tile_yell_name', 'Floor Tiles', 6433)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_desc', 'Amateur battle ball!', 6434)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('decision_cancel', 'Cancel', 6435)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo2_name', 'Screen', 6436)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_place', 'Note!', 6437)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_unacceptableName', 'Sorry, that name is unacceptable to the game Management', 6438)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_intro', 'Welcome to Thor Club - the members only club that all the best palyers belong to!\r\rMembers of Thor Club get priority access to the game (so you can always get in), rare furni and special room layouts. To see exactly what you''ll be able to get your hands', 6439)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*6_name', 'Glass chair', 6440)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*7_name', 'Purple Oriental Screen', 6441)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_name', 'Name of your player', 6442)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem9', 'Decaff', 6443)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_post.it.vd_name', 'Heart stickies', 6444)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem8', 'Regular', 6445)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem7', 'Water', 6446)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_heartsofa_name', 'Heart Sofa', 6447)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem6', 'Blackcurrant', 6448)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem5', 'Milk', 6449)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem4', 'Ice-cream', 6450)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem3', 'Carrot', 6451)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorD_desc', 'Let''s go over tzar!', 6452)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem2', 'Juice', 6453)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('handitem1', 'Tea', 6454)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.play_dead', 'play dead', 6455)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*5_name', 'Pink Iced Auto Shutter', 6456)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_fireplace_polyfon_desc', 'Comfort in stainless steel', 6457)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_age', 'You are under 11 years old. Children under 11 can''t enter Thor. Sorry!', 6458)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*5_desc', 'Hip plastic furniture', 6459)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*9_desc', 'Hip plastic furniture', 6460)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_topics', 'Help Topics:', 6461)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*2_name', 'Black Silo Dining Chair', 6462)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*4_desc', 'Beige Mode Sofa', 6463)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen2_desc', 'What''s inside?', 6464)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_close', 'Sulje kioski', 6465)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood1_desc', 'Natural nutrition for the barking one', 6466)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja_desc', 'Rejuvenate your pixels!', 6467)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_t1_1', 'Kaupunkien pu_t2_2', 6468)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*8_desc', 'Cool cornering for your crib y0!', 6469)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_paycoins', 'Buy subscription', 6470)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*0_desc', 'Minimalist comfort!', 6471)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*9_desc', 'Red Iced Sofa', 6472)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_game_checkname', 'Please check the Game''s name!', 6473)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1004_desc', 'Celebrate with us', 6474)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_ham2_name', 'Eaten Ham', 6475)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*7_name', 'Bonnie’s Pillow', 6476)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*4_desc', 'it''s bouncy-tastic', 6477)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*3_desc', 'White Mode Bardesk Corner', 6478)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*3_name', 'Aqua Marquee', 6479)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_parasol*2_name', 'Orange Parasol', 6480)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pickup', 'Pick up', 6481)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_end_title', 'Your Thor Club membership has now expired.', 6482)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_nameshow', 'Show your name in the room info', 6483)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_md_limukaappi_desc', 'Proud sponsor of Football 2006', 6484)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*6_name', 'Square Dining Table', 6485)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_helppledge', 'http://%predefined%//footer_pages/privacy_policy.html', 6486)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*9_desc', 'For nic naks and art deco books', 6487)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*4_name', 'Square Dining Table', 6488)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_globe_name', 'Snow Globe', 6489)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_purse_link', 'http://%predefined%//credits/?', 6490)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_change', 'Change queue', 6491)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_send_reply', 'Send reply', 6492)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_member', 'Member', 6493)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*2_desc', 'Totally shatter-proof!', 6494)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*3_desc', 'Practical and convenient', 6495)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_pickedby', 'Picked Up By:', 6496)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*5_desc', 'For larger gatherings', 6497)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*9_desc', 'Energy beams. No trespassers!', 6498)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*2_name', 'Black Iced Sofachair', 6499)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*5_name', 'Plastic Pod Chair', 6500)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('help_emergency_example', 'Example: Daisy is being racist.', 6501)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_door_desc', 'Dr Who?', 6502)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habboclub_require_parent_permission', 'You need to tick the box to say that you are over 14 years or age, \ror under 14 and have your parent/guardian''s permission to join Thor Club. \rPlease go back and tick the box.', 6503)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_badge_hidden', 'Hidden', 6504)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_sms_win_btcellnet', 'O2 SMS', 6505)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*3_name', 'Sport track straight grass', 6506)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('error_ok', 'OK->', 6507)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*7_name', 'Brown Powered Fan', 6508)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.na.alert', 'This Room is for Staff only.', 6509)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_beehive_bulb*1_name', 'Red Amber Lamp', 6510)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*3_name', 'White Area Occasional Table', 6511)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_searchbutton', 'Search', 6512)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hologram_desc', 'As if by magic...', 6513)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_1_name', 'Tournament Lobby', 6514)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*2_desc', 'Scary and scorching!', 6515)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_camera_desc', 'Smile!', 6516)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*4_desc', 'Beige Area Corner Shelf', 6517)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_40_name', 'Bonnie Blonde', 6518)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*8_desc', 'Yellow Area Gate', 6519)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*9_name', 'Purple Dragon Lamp', 6520)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_amateur_6_name', 'Snow Slingers Lobby', 6521)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_7/0_desc', ' ', 6522)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*5_desc', 'Available in a variety of colours', 6523)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('wallitem_post.it_desc', 'Pad of stickies', 6524)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*2_name', 'Black Ice corner', 6525)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*1_desc', 'Chill and wait your turn!', 6526)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_buytickets', 'Buy Tickets', 6527)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_check_name', 'Name', 6528)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_turkey_desc', 'Where''s the cranberry sauce?', 6529)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*6_name', 'Blue Iced gate', 6530)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_cn_sofa_desc', 'Oriental seating for three', 6531)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_intermediate_desc', 'For the accomplished Snow Stormers.', 6532)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Alert_BuyingOK', 'Buying Successful!', 6533)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_8', 'To start a Game, there must be at least two Teams of one player each!', 6534)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*3_desc', 'Hip plastic furniture', 6535)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_6', 'You have been removed from the Game!', 6536)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_expert_0_name', 'Expert', 6537)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_5', 'Tournament is only available for users living in the UK.', 6538)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*5_desc', 'Pink Iced bar desk', 6539)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_4', 'You have reached your maximum number of daily Games!', 6540)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*4_desc', 'Beige Mode Bardesk Gate', 6541)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_2', 'You don''t have enough Tickets!', 6542)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*2_desc', 'Black Area Sofa', 6543)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_1', 'You have entered invalid data!', 6544)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_creatingaprofile', 'Creating A Profile', 6545)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_shortenPW', 'Your password cannot be longer than 9 characters. Your password must contain 6-9 characters and have at least one number.', 6546)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_birdie_desc', 'Cheep (!) and cheerful', 6547)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*9_desc', 'Roll out!', 6548)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_accept', 'Accept', 6549)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*4_name', 'Beige Mode Armchair', 6550)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*1_name', 'Red Sleeping Bag', 6551)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*9_name', 'Red Area Sofa', 6552)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*5_name', 'Pink Chair', 6553)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('kicked_out.reason', 'You have been removed for breaking the Thor rules:', 6554)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_505_name', 'The Maple Leaf', 6555)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_remove_text', 'You are about to remove %removeamount% friends from your friendlist.\r\r After removal, you''ll have %amountleft% friends on your list:', 6556)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_silo_studydesk_desc', 'Area Master Desk', 6557)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_cryforhelp', 'Call For Help:', 6558)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*3_desc', 'Translucent beauty', 6559)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare_name', 'Square Dining Table', 6560)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*6_desc', 'Blue Silo Dining Chair', 6561)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_button_ready', 'Ready', 6562)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*10_desc', 'Hip plastic furniture', 6563)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_skullcandle_desc', 'Alas poor Yorrick...', 6564)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*16_name', 'Chair', 6565)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_16_name', 'Bars', 6566)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree2_name', 'Old Christmas Tree', 6567)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*3_desc', 'Ancient and stately', 6568)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_china_desc', 'The elegant beauty of tradition', 6569)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('ph_keys_spacebar', 'Spacebar', 6570)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_ok', 'Change cards', 6571)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_moonrug_desc', 'Built in 1969!', 6572)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('credits', 'Credits', 6573)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_uk', 'UK', 6574)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_7_name', 'Free Game Lobby', 6575)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('move_furniture', 'Move Furni', 6576)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_50_name', 'Bat Poster', 6577)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_523_desc', 'The flag of India', 6578)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('login_connecting', 'Connecting...', 6579)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_text_hostInfo', 'Please choose a name for your Game and select the number of Teams.', 6580)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_tournament_name', 'Playing a tournament game!', 6581)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*7_desc', 'It''s both door and a shade!', 6582)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_elephant_statue_desc', 'Say hello to Nelly', 6583)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*5_name', 'Alien Artifact  # 1337', 6584)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*3_desc', 'Aqua unlimited', 6585)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_theatredrome_easter/0_desc', ' ', 6586)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_34_desc', 'Punk for the never-agreeing', 6587)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_profile_helptext', 'The player profile is a snapshot of your interests and hobbies - simply tick the things you like.', 6588)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_timeleft', 'Time:', 6589)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('Unreadmessages', 'New Message(s)', 6590)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bunny_desc', 'Yours to cuddle up to', 6591)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_9/0_desc', ' ', 6592)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*8_desc', 'Hip plastic furniture', 6593)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard_name', 'Floor rug', 6594)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*5_desc', 'They''re out of this world!', 6595)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*1_desc', 'Let''s get sporty!', 6596)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_timetojoin', '\x seconds to join', 6597)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva_desc', 'Strut your funky stuff!', 6598)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_mainhelp', 'Console Help', 6599)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2_name', 'Carrot Plaque', 6600)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3_desc', 'Do go through...', 6601)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_2min', '2min', 6602)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_2teams', '2 Teams Game', 6603)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_515_name', 'The Swedish flag', 6604)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('shout', 'Shout', 6605)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*9_desc', 'Hip plastic furniture', 6606)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_people', 'Who''s in here?', 6607)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_expert_1_name', 'Snow Marksmen Lobby', 6608)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_18/0_desc', ' ', 6609)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/1_name', 'Gamehall Lobby', 6610)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*7_name', 'Glass table', 6611)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_26_name', 'Stocking', 6612)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_helpparents', 'http://%predefined%//help/parents_guide.html', 6613)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*6_name', 'Blue Roller', 6614)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*7_desc', 'Green Area Occasional Table', 6615)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('alert_reg_t', 'Please check these details:', 6616)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2001_desc', 'Perinteinen ryijy,', 6617)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_silo*3_desc', 'White Area Armchair', 6618)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_arena_amateur_name', 'Playing amateur game', 6619)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doorB_name', 'Wardrobe', 6620)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_purselink', 'http://%predefined%//credits/?', 6621)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_2008_name', 'Cola Poster', 6622)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('close', 'Close', 6623)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_djesko_turntable_desc', 'For the retro music-lover', 6624)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_44_desc', 'Beware the curse...', 6625)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*6_desc', 'Blue Ice corner', 6626)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*3_name', 'Square Dining Table', 6627)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*14_desc', 'Hip plastic furniture', 6628)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_round*7_name', 'Round Dining Table', 6629)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('start', 'Start', 6630)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_pickup_go', 'Pick Up & Go!', 6631)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_couch_norja*8_name', 'Yellow Bench', 6632)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*2_name', 'Black Mode Sofa', 6633)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_9/0_desc', ' ', 6634)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('catalog_give_petname', 'Type your pet''s name in the grey box.', 6635)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_name', 'Room:', 6636)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*10_desc', 'Hip plastic furniture', 6637)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_doormat_plain*5_name', 'Doormat', 6638)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_one*8_name', 'Yellow Mode Single Bed', 6639)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5*6_name', 'Blue Iced Angle', 6640)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_beauty_salon_general/0_desc', 'Meet Jamelia in her Beauty Salon', 6641)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofa_norja*7_name', 'Green Iced Sofa', 6642)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_incorrectBirthday', 'Your birthday was incorrect', 6643)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('cam_save_nofilm', 'You have run out of film.\rGet a roll (5 photos) from\rthe Catalogue for 6 Credits.', 6644)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_chromide_club/0_desc', 'Ghetto Fabulous', 6645)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1002_name', 'Queen Mum Poster', 6646)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('password.email.subject', 'Forgotten password', 6647)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_goyourroom', 'Go to your room', 6648)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('delete', 'Delete', 6649)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1*2_name', 'Rubber Ball', 6650)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_habbo_lido_ii/0_desc', 'Dive right in!', 6651)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_soft*5_name', 'Soft Wool Rug', 6652)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info_link2', 'FRANK Website', 6653)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_chromide_club_name', 'The Chromide Club', 6654)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hubu_info_link1', 'FRANK Infobus Information', 6655)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*8_desc', 'Yellow Mode Armchair', 6656)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*5_desc', 'Ultimate outdoor coziness', 6657)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*9_desc', 'Sleek and chic for each cheek', 6658)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_509_desc', 'The flag of Jamaica', 6659)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_eric''s_eaterie/0_desc', 'Join Eric for a bite to eat', 6660)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp2_armas_desc', 'Wax lyrical with some old-world charm', 6661)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_report', 'Report', 6662)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_shelves_norja*7_name', 'Green Bookcase', 6663)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool*3_desc', 'Translucent beauty', 6664)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cafe_gold/0_desc', 'Just an illusion', 6665)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toy1_desc', 'it''s bouncy-tastic', 6666)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*0_desc', 'Energy beams. No trespassers!', 6667)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('interface_icon_purse', 'Purse - manage your Credits', 6668)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_txt_paycash', 'Pay by Cash', 6669)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*3_name', 'Large Coffee Table White', 6670)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_54_desc', 'whack that ball!', 6671)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*1_desc', 'Virtual vanilla rocks!', 6672)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_ready', 'READY', 6673)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifiport*7_name', 'Turquoise Sci-Fi Port', 6674)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_beginner_2_name', 'Snow Rookies Lobby', 6675)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack1*2_desc', 'Let''s get sporty!', 6676)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('send', 'Send', 6677)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('transaction_system_bibit', 'Credit card', 6678)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_icecream*8_name', 'Aqua Ice Cream Maker', 6679)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*9_desc', 'High technology in a retro frame', 6680)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_the_dirty_duck_pub/0_desc', 'Meet Dave the firendly landlord!', 6681)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_forcedupdate3', 'The Thor management requires all Habbos to read and agree to the service Terms and Conditions. It won''t take long.\rJust go through the registration, check your  info and agree to the new terms. Thank you!', 6682)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_forcedupdate2', 'Update your player', 6683)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy4*1_desc', 'Glittery gold', 6684)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon_desc', 'Give yourself space to stretch out', 6685)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.play.dog.1', 'woofWOOFwoofWOOFwoof', 6686)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.play.dog.0', 'rrr.. WOOF .rrr..', 6687)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_stool_desc', 'Translucent beauty', 6688)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*0_name', 'Fire Dragon Lamp', 6689)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*2_name', 'Black Area Corner Shelf', 6690)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_13/0_desc', ' ', 6691)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_6_desc', 'but is it the right way up?', 6692)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo3*6_name', 'Blue Area Gate', 6693)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*2_desc', 'Black Area Coffee Table', 6694)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*1_desc', 'Soft and tearproof!', 6695)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy*2_name', 'Classic trophy', 6696)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*9_desc', 'Totally shatter-proof!', 6697)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*3_name', 'Floor Rug', 6698)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_public_helptext', 'These are game''s public areas. What are you waiting for? Go and meet other mortals!', 6699)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/5_desc', 'Get a hand like a foot? Keep a straight face and bluff it out', 6700)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med*9_name', 'Red Area Coffee Table', 6701)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*9_name', 'Red Iced Sofachair', 6702)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rubberchair*8_name', 'Black Inflatable Chair', 6703)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_hotelview', 'Thor Front View', 6704)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_goodie1*1_name', 'Marzipan Man', 6705)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*2_desc', 'Add an exotic touch to your room', 6706)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bar_polyfon_desc', 'You naughty player!', 6707)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_shelf_name', 'Glass shelf', 6708)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_chair*8_name', 'Glass chair', 6709)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*9_name', 'Green Oriental Screen', 6710)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*1_name', 'Chair', 6711)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*3_name', 'White Iced bar desk', 6712)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*2_name', 'Black Mode Bardesk Gate', 6713)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja_name', 'Chair', 6714)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja_name', 'iced sofachair', 6715)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor4*7_name', 'Green Iced Auto Shutter', 6716)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto_desc', 'Hip plastic furniture', 6717)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('camera_dialog_place', 'Move', 6718)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_modify_doorstatus', 'Door status', 6719)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_hc_more_info', 'More Info About Thor Club >>', 6720)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_newmessages', 'New Message(s)', 6721)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square*7_desc', 'Hip plastic furniture', 6722)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_old_skool/0_desc', ' ', 6723)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*4_name', 'Beige Silo Dining Chair', 6724)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_polar*2_desc', 'Snuggle up on a Funky bear rug...', 6725)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon*6_desc', 'Blue Mode Sofa', 6726)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_present_gen4_desc', 'What''s inside?', 6727)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*1_name', 'Pink Marble Pillar', 6728)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_petfood3_desc', 'Health food for pets', 6729)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardesk_polyfon*5_desc', 'Pink Mode Bardesk', 6730)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*2_desc', 'Puffy, soft and huge', 6731)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1006_desc', 'The eyes follow you...', 6732)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_521_name', 'Flag of Brazil', 6733)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_trad_name', 'Plain Double Bed', 6734)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bath_desc', 'The ultimate in pampering', 6735)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('LoadingRoom', 'Loading room...', 6736)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('modtool_roomalert', 'Room Alert', 6737)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*1_desc', 'Hip plastic furniture', 6738)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_deadduck_name', 'Dead Duck', 6739)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillow*9_name', 'Green Wooly Pillow', 6740)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bardeskcorner_polyfon*5_desc', 'Pink Mode Bardesk Corner', 6741)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*5_name', 'Graphite Marquee', 6742)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_logoff ', 'Left the game', 6743)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*1_name', 'Red Water Bowl', 6744)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bench_armas_desc', 'To complete the dining set', 6745)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_bigsquare*8_name', 'Square Dining Table', 6746)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_32_name', 'Siva Poster', 6747)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_4leg*6_name', 'Occasional table Table', 6748)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_1_desc', 'a touch of history', 6749)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_mammoth/0_name', 'Club Mammoth', 6750)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_lamp_armas_desc', 'Ambient lighting is essential', 6751)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_hyacinth2_desc', 'Beautiful bulb', 6752)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('habbo_hand_prev', '<<<', 6753)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*3_name', 'Lightblue Spaceship Door', 6754)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('int_newmessages', 'New Message(s)', 6755)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_small_cactus_desc', 'Even less watering than the real world', 6756)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_deathmatch', 'Every player for himself!', 6757)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*4_desc', 'Totally shatter-proof!', 6758)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barchair_silo*5_desc', 'Practical and convenient', 6759)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1_name', 'Ice Corner', 6760)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('hobba_sent_to_helpers', 'CFH upgraded to emergency.', 6761)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_norja_med*7_desc', 'For larger gatherings', 6762)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy3*2_desc', 'Shiny silver', 6763)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_club_massiva/1_name', 'Chill-out Room', 6764)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_soft_sofachair_norja*4_name', 'Aquamarine Iced Sofachair', 6765)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasty*7_name', 'Plastic Pod Chair', 6766)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance4', 'The Rollie', 6767)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance3', 'Duck Funk', 6768)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance2', 'Pogo Mogo', 6769)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prize2_name', 'Silver Trophy', 6770)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*2_desc', 'Be cool!', 6771)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('dance1', 'Hab-Hop', 6772)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_header_gamelist', 'Game List', 6773)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_title_gameCreation', 'Create A New Game!', 6774)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack3*2_desc', 'Let''s get sporty!', 6775)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wcandleset_name', 'White Candle Plate', 6776)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fan*9_name', 'Fucsia Powered Fan', 6777)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_invert', 'Invert Selection', 6778)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_small*5_name', 'Pink Area Occasional Table', 6779)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_toilet_yell_name', 'Loo Seat', 6780)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_mouseover_player', '\x\r\yp', 6781)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_polyfon_name', 'Two-seater Sofa', 6782)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.dc.info', 'Number of Thor in default queue is %d% and in Thor Club queue %c%', 6783)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('sw_link_gameRules_url', '(URL TO SNOWWAR GAME RULES)', 6784)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_skylight_lobby_name', 'Skylight Lobby', 6785)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_tournament_3_name', 'Tournament Lobby', 6786)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_dragonlamp*4_desc', 'The very essence of evil', 6787)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_silo1*6_desc', 'Blue Area Corner Shelf', 6788)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_testim_04', '"I got my first Credits with my Splash Plastic card, now I''ve got a really cool room."', 6789)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy6*1_desc', 'Glittery gold', 6790)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_testim_03', '"I use my Splash Plastic card all over the place - to buy Thor Credits, CDs, games, the lot! You can find all the online shops that take it on the Splash Plastic website."', 6791)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_testim_02', '"I always use Splash Plastic to buy Thor Credits - it''s so easy."', 6792)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('splash_testim_01', 'Here''s what other players say about Splash Plastic:', 6793)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pumpkin_desc', 'Cast a spooky glow', 6794)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_42_name', 'Spiderweb', 6795)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_tournament_15/0_desc', ' ', 6796)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.beg', 'beg', 6797)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_arm2_name', 'Room divider', 6798)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('buddyremove_logintime', 'Last Login Time', 6799)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('win_voucher', 'Thor Credit Code', 6800)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_carpet_standard*7_desc', 'Available in a variety of colours', 6801)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor1*4_name', 'Aquamarine Ice corner', 6802)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_traffic_light*3_desc', 'Chill and wait your turn!', 6803)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('roomatic_givename', 'Give your room a name!', 6804)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor3*8_name', 'Yellow Iced gate', 6805)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('bb_link_highScores_url', 'http://www.habbohotel.co.uk/games/battleball/high_scores.html', 6806)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_basement_lobby_name', 'Basement Lobby', 6807)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_public_helptext_hd', 'Asgard', 6808)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.beg.cat.2', 'MEOW, MEOW, MEOW..', 6809)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.beg.cat.1', '*looks up with sad eyes*', 6810)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('url_logout_concurrent', 'http://%predefined%//account/disconnected?reason', 6811)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.saying.beg.cat.0', 'MaUUU...MEOW...meow', 6812)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*5_desc', 'Hip plastic furniture', 6813)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_solarium_norja*2_name', 'Beige Solarium', 6814)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor2*7_desc', 'Green Iced  bar desk', 6815)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_poly3*6_desc', 'Blue Mode Bardesk Gate', 6816)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofa_silo*4_desc', 'Beige Area Sofa', 6817)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_500_desc', 'The UK flag', 6818)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('game_poker_changed', 'changed', 6819)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_stand_polyfon_z_name', 'Shelf', 6820)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('partner_registration_link', 'Finish registration', 6821)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_budgetb_desc', 'Sweet dreams for two', 6822)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sofachair_polyfon*6_name', 'Blue Mode Armchair', 6823)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sleepingbag*3_name', 'Ocean Sleeping Bag', 6824)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_plasto*11_desc', 'Hip plastic furniture', 6825)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_norja*7_name', 'Green Chair', 6826)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_joulutahti_desc', 'Christmas in a pot', 6827)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_507_name', 'The French Tricolore', 6828)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_daffodil_rug_desc', 'A little bit of outdoors indoors..', 6829)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('x', 'X', 6830)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_11_desc', 'award, charter or the Thor Rules - you decide', 6831)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_hungry', 'Hunger:', 6832)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_sofa*5_desc', 'Translucent beauty', 6833)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_chair_silo*8_desc', 'Yellow Silo Dining Chair', 6834)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_18_name', 'Butterfly Cabinet (blue)', 6835)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_tree4_name', 'Christmas Tree 2', 6836)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_pillar*5_desc', 'Find your natural roots', 6837)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_rare_fountain*2_desc', ' For our feathered friends', 6838)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_barrier*1_desc', 'No trespassing, please!', 6839)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_armas_desc', 'For informal dining', 6840)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_habbocake_name', 'Cake', 6841)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_welcome3', 'Now the fun begins! All you need to do is register and you''re ready to start. It won''t take long!\rYou can change everything except your name and date of birth later. Come on!', 6842)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_welcome2', 'Create Your Own Player', 6843)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_bed_polyfon*3_name', 'White Mode Double Bed', 6844)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sw_lobby_free_9_name', 'Free Game Lobby', 6845)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_52_name', 'Hockey Stick', 6846)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_tryingpw', 'Trying the password...', 6847)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*0_desc', 'High technology in a retro frame', 6848)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('purse_info', 'DESCRIPTION', 6849)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_marquee*9_desc', 'Keep the mob out', 6850)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_line', 'You are queueing right now...', 6851)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifirocket*7_name', 'Aqua Smoke Machine', 6852)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_waterbowl*5_desc', 'Aqua unlimited', 6853)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_36_desc', 'The games girlband. Dream on!', 6854)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_silo_med_desc', 'Wipe clean and unobtrusive', 6855)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_table_plasto_square_name', 'Occasional Table', 6856)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_amateur_10/0_desc', ' ', 6857)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_bb_lobby_beginner_1/0_desc', ' ', 6858)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet.hotwords.bad', 'bad', 6859)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_024', 'Black-eyed Boxer', 6860)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_023', 'Dotty Dalmatian', 6861)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_error_watch_0', 'All The Spectator Seats Are Taken!', 6862)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_022', 'Schnitzel Snatcher', 6863)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_021', 'Loyal Labrador', 6864)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('queue_set.s.info', 'There are %d% players in front of you in the queue to see the Live broadcast!', 6865)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_020', 'Patchy Pup', 6866)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_legal_header2', 'Read through the below text carefully. You must agree to the following terms before entering Thor.', 6867)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_legal_header1', 'Now you need to ask your parents/guardian to come to the computer. Read through the text (below) with your parents.', 6868)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_plant_rose_desc', 'Sleek and chic', 6869)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_scifidoor*7_desc', 'They''re out of this world!', 6870)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_sporttrack2*3_desc', 'Let''s get sporty!', 6871)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_red_tv_desc', 'Don?t miss those soaps', 6872)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_510_desc', 'The flag of Italy', 6873)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_4_name', 'Bear Plaque', 6874)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_thanks_title', 'Congratulations! You are now a member of Thor Club.', 6875)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_019', 'Tiny Terrier', 6876)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_018', 'Bushy Woofer', 6877)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_divider_nor5_desc', 'Cool cornering for your crib y0!', 6878)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_017', 'Speckled Sheepdog', 6879)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_016', 'Murmurin'' Minimastiff', 6880)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_015', 'Pixie Poodle', 6881)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*2_desc', 'Translucent beauty', 6882)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('gs_4teams', '4 Team Game', 6883)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_014', 'Whiffy Woofy', 6884)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_013', 'Mangy Mutt', 6885)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_517_name', 'The Scottish flag', 6886)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_012', 'Tawny Bleugh', 6887)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_011', 'Lappy Lassie', 6888)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('console_usersnotfound', 'Player Not Found', 6889)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('pet_race_0_010', 'Furry McScottie', 6890)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_21_desc', 'See that halo gleam!', 6891)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_mocchamaster_name', 'Mochamaster', 6892)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_safe_silo*7_name', 'Green Safe Minibar', 6893)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*1_desc', 'The power of movement', 6894)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_confirm_title', 'You are about to subscribe to Thor Club. Wise choice!', 6895)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_cunning_fox_gamehall/3_name', 'Batleships', 6896)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('reg_verification_incorrectPassword', 'Your password was incorrect', 6897)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_prizetrophy5*2_desc', 'Shiny silver', 6898)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_glass_table*9_name', 'Glass table', 6899)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('poster_28_name', 'Tinsel (silver)', 6900)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('club_desc_1_period', '1 Month (31 days) ', 6901)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_wooden_screen*0_name', 'White Oriental Screen', 6902)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('furni_queue_tile1*8_name', 'Navy Roller', 6903)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('room_cant_trade', 'You cannot trade this!', 6904)
GO
INSERT INTO ExternalTexts (TextName, TextValue, TextID)
VALUES('nav_venue_sun_terrace/0_desc', 'For lazy afternoons and super tan treatment!', 6905)
GO

-- Disable identity insert
SET IDENTITY_INSERT ExternalTexts OFF
GO



-- Dumping data for table 'ExternalVars'
--

-- Enable identity insert
SET IDENTITY_INSERT ExternalVars ON
GO

INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('navigator.private.default', '4', 1)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.small.5', 'hh_pets_50', 2)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.item.ctrl', '[]', 3)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.small.4', 'hh_furni_special_50', 4)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.small.3', 'hh_furni_drken_50', 5)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.small.2', 'hh_furni_armas_50', 6)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.9', ' hh_kiosk_room', 7)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.active.owner', '["move","rotate","pick"]', 8)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.small.1', 'hh_furni_items_50', 9)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.8', ' hh_people_2', 10)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('moderator.cmds', '[":alert x",":ban x",":kick x",":superban x",":shutup x",":unmute x",":transfer x",":softkick x"]', 11)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.7', ' hh_people_1', 12)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.6', ' hh_registrat', 13)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.5', ' hh_messenger', 14)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.4', ' hh_entry', 15)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.3', ' hh_shared', 16)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('client.window.title', 'Thor Client', 17)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.2', ' hh_patch_uk', 18)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('image.library.url', 'http://www.script-o-matic.net/thor/images', 19)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.1', ' hh_interface', 20)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.photo.owner', '["pick","delete"]', 21)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interstitial.max.displays', '5', 22)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('navigator.visible.public.root', '3', 23)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.15', 'hh_purse', 24)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.14', 'hh_navigator', 25)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.13', 'hh_entry_no', 26)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.12', 'hh_photo', 27)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.11', 'hh_club', 28)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('cast.entry.10', 'hh_room', 29)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.item.owner', '["pick"]', 30)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.user.owner', '["take_rights","give_rights","kick","friend","trade","ignore","unignore"]', 31)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('language', 'en', 32)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('swimjump.key.list', '[#run1:"A", #run2:"D", #dive1:"W", #dive2:"E", #dive3:"A", #dive4:"S", #dive5:"D", #dive6:"Z", #dive7:"X", #jump:"SPACE"]', 33)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.private', '["hh_room_private"]', 34)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('client.version.id', '401', 35)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.9', 'hh_cat_gfx_all', 36)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.8', 'hh_cat_code', 37)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.7', 'hh_furni_special', 38)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.6', 'hh_furni_drken', 39)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.5', 'hh_furni_armas', 40)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('permitted.name.chars', '1234567890qwertyuiopasdfghjklzxcvbnm-', 41)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.4', 'hh_furni_small', 42)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.3', 'hh_furni_items', 43)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.2', 'hh_people_small_2', 44)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.1', 'hh_people_small_1', 45)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.user.personal', '["badge","dance","wave","hcdance"]', 46)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.cast.10', 'hh_pets', 47)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.user.friend', '["friend","trade","ignore","unignore"]', 48)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.default.wall', '201', 49)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('struct.font.tooltip ', '[#font:"v", #fontSize:9,#lineHeight:10,#color:rgb("#000000"),#ilk:#struct,#fontStyle:[#plain]]', 50)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('fuse.project.id', 'habbo_uk', 51)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.user.ctrl', '["kick","friend","trade","ignore","unignore"]', 52)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.photo.ctrl', '[]', 53)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('navigator.public.default', '3', 54)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('struct.font.link    ', '[#font:"v", #fontSize:9,#lineHeight:10,#color:rgb("#000000"),#ilk:#struct,#fontStyle:[#underline]]', 55)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('struct.font.italic  ', '[#font:"v", #fontSize:9,#lineHeight:10,#color:rgb("#000000"),#ilk:#struct,#fontStyle:[#italic]]', 56)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('navigator.visible.private.root', '4', 57)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('paalu.key.list', '[#bal1:"Q", #bal2:"E", #push1:"A", #push2:"D", #move1:"N", #move2:"M", #stabilise:"SPACE"]', 58)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interstitial_ad_show_delay', '5000', 59)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('struct.font.bold    ', '[#font:"vb",#fontSize:9,#lineHeight:10,#color:rgb("#000000"),#ilk:#struct,#fontStyle:[#plain]]', 60)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('interface.cmds.active.ctrl', '["move","rotate"]', 61)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('purse.transactions.active', '1', 62)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('room.default.floor', '111', 63)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('struct.font.plain   ', '[#font:"v", #fontSize:9,#lineHeight:10,#color:rgb("#000000"),#ilk:#struct,#fontStyle:[#plain]]', 64)
GO
INSERT INTO ExternalVars (VarName, VarValue, VarId)
VALUES('external.figurepartlist.txt', 'http://asgard/thor/figure.txt', 65)
GO

-- Disable identity insert
SET IDENTITY_INSERT ExternalVars OFF
GO


-- Dumping data for table 'FurniDefinitions'
--

-- Enable identity insert
SET IDENTITY_INSERT FurniDefinitions ON
GO

INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(1, 'spyro', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(2, 'bardeskcorner_polyfon', 'MO', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(3, 'sofachair_polyfon', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.2, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(4, 'poster', 'V', 0, 0, '24', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(5, 'bar_polyfon', 'M', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(6, 'bardesk_polyfon', 'MO', 2, 1, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(8, 'sofa_polyfon', 'SM', 2, 1, '0,0,0', 0.0, 'S', 0, 1.2, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(9, 'bed_polyfon', 'LT', 2, 3, '0,0,0', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(10, 'bed_polyfon_one', 'LT', 1, 3, '0,0,0', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(11, 'divider_poly3', 'M', 1, 1, '0,0,0', 0.0, 'S', 2, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(13, 'queue_tile1*3', 'OPR', 1, 1, '#ffffff,#6ED0A7,#ffffff,#ffffff', 0.45, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(15, 'edice', 'M', 1, 1, '0,0,0', 0.0, 'S', 3, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(16, 'door', 'MZX', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(17, 'throne', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(18, 'mocchamaster', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(19, 'prize2', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(22, 'post.it', 'VN', 0, 0, 'FFFF33', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(23, 'post.it', 'VN', 0, 0, 'FF9CFF', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(24, 'post.it', 'VN', 0, 0, '9CFF9C', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(25, 'post.it', 'VN', 0, 0, '9CCEFF', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(26, 'wallpaper', 'VD', 0, 0, '0', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(27, 'floor', 'VD', 0, 0, '0', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(70, 'crl_lamp', ' ', 1, 1, '0,0,0', 0.0, 'P', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(71, 'crl_sofa2c', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(72, 'crl_sofa2b', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(73, 'crl_sofa2a', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(74, 'crl_chair', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(75, 'crl_pillar', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(76, 'crl_table1b', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(77, 'crl_sofa1c', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(78, 'crl_table2b', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(79, 'crl_table2a', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(80, 'crl_table1a', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(81, 'crl_sofa1b', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(82, 'crl_wall2a', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(83, 'crl_sofa1a', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(84, 'crl_sofa3c', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(85, 'crl_sofa3b', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(86, 'crl_sofa3a', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(87, 'crl_barchair2', 'S', 1, 1, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(88, 'crl_tablebar', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(89, 'crl_pillar2', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(90, 'crl_desk1a', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(91, 'crl_deski', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(92, 'crl_deskh', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(93, 'crl_deskg', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(94, 'crl_deskf', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(95, 'crl_deske', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(96, 'crl_wallb', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(97, 'crl_walla', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(98, 'crl_desk1b', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(99, 'crl_desk1c', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(100, 'crl_desk1d', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(101, 'crl_lamp2', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(102, 'crl_cabinet2', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(103, 'crl_cabinet1', ' ', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(104, 'libchair', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(105, 'libstool', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(106, 'umbrella2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(107, 'pool_2sofa2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(108, 'pool_2sofa1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(109, 'pool_chair2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(110, 'pool_table2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(111, 'flower2b', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(112, 'flower2a', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(113, 'box', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(114, 'flower1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(115, 'pool_chairy', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(116, 'umbrellay', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(117, 'pool_tabley', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(118, 'umbrellap', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(119, 'umbrellao', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(120, 'pool_chairp', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(121, 'pool_chairo', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(122, 'pool_tablep', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(123, 'pool_tabo', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(124, 'pool_tabo2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(125, 'pool_tablep2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(126, 'pool_chairg', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(127, 'pool_tablg', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(128, 'pool_tablg2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(129, 'umbrellag', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(130, 'float_dummychair', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(131, 'float_dummychair2', 'S', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(132, 'floatbench2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(133, 'floatbench1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(215, 'bunny', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(218, 'red_tv', 'M', 1, 1, '0,0,0', 0.5, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(219, 'doorB', 'MZX', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(220, 'doorC', 'MZX', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(20, 'wcandleset', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(21, 'pumpkin', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(216, 'tv_luxus', 'M', 1, 3, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(217, 'wood_tv', 'M', 1, 2, '0,0,0', 0.0, 'S', 6, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(28, 'bed_silo_two', 'LT', 2, 3, '0,0,0', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(29, 'bed_silo_one', 'LT', 1, 3, '0,0,0', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(30, 'shelves_silo', ' ', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(31, 'sofa_silo', 'SM', 2, 1, '0,0,0,0,#A2C6C8,#A2C6C8 ', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(32, 'sofachair_silo', 'SM', 1, 1, '0,0,#A2C6C8,#A2C6C8,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(33, 'table_silo_small', 'M', 1, 1, '0,#A2C6C8,0,#A2C6C8', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(34, 'divider_silo3', 'M', 1, 1, '0,0,0,#A2C6C8', 0.0, 'S', 2, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(35, 'divider_silo2', 'M', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(36, 'divider_silo1', 'M', 1, 1, '0,#A2C6C8,0,#A2C6C8 ', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(40, 'chair_norja', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(41, 'couch_norja', 'SM', 2, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(42, 'table_norja_med', ' ', 2, 2, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(43, 'shelves_norja', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(44, 'soft_sofachair_norja', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(45, 'soft_sofa_norja', 'S', 2, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(46, 'divider_nor2', ' ', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(47, 'divider_nor1', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(48, 'divider_nor3', 'M', 1, 1, '0,0,0', 0.0, 'S', 2, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(49, 'sofachair_polyfon_girl', 'SM', 1, 1, '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(50, 'sofa_polyfon_girl', 'SM', 2, 1, '#ffffff,#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4', 0.0, 'S', 0, 1.2, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(51, 'carpet_polar*1', 'PMO', 2, 3, '#ffbbcf,#ffbbcf,#ffddef', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(54, 'bed_armas_two', 'LT', 2, 3, '0,0,0', 0.0, 'S', 0, 1.8, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(55, 'bed_armas_one', 'LT', 1, 3, '0,0,0', 0.0, 'S', 0, 1.7, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(56, 'fireplace_armas', 'M', 2, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(57, 'bartable_armas', ' ', 1, 3, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(58, 'table_armas', 'O', 2, 2, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(59, 'bench_armas', 'S', 2, 1, '0,0,0', 0.0, 'S', 0, 1.2, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(60, 'divider_arm3', 'M', 1, 1, '0,0,0', 0.0, 'S', 2, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(61, 'divider_arm1', 'MO', 1, 1, '0,0,0', 1.3, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(62, 'divider_arm2', 'M', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(63, 'shelves_armas', ' ', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(64, 'bar_armas', ' ', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(65, 'bar_chair_armas', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.2, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(66, 'lamp_armas', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(67, 'lamp2_armas', 'MO', 1, 1, '0,0,0', 1.1, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(68, 'small_table_armas', 'MO', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(69, 'small_chair_armas', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(37, 'chair_silo', 'SM', 1, 1, '0,0,#A2C6C8,#A2C6C8,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(39, 'table_silo_med', ' ', 2, 2, '0,#8FAEAF ', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(52, 'bed_polyfon_girl_one', 'LT', 1, 3, '#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4 ', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(53, 'bed_polyfon_girl', 'LT', 2, 3, '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 0.0, 'S', 0, 1.6, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(212, 'mic', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(213, 'thchair2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(214, 'thchair1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(222, 'doormat_plain*1', 'PMF', 1, 1, '#ff1f08', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(223, 'poster', 'V', 0, 0, '1005', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(224, 'stand_polyfon_z', 'OM', 1, 1, '0,0,0', 0.5, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(225, 'present_gen', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(226, 'present_gen1', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(249, 'carpet_soft*5', 'POM', 2, 4, '#FFFF66', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(251, 'hologram', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(252, 'skullcandle', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(253, 'redhologram', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(254, 'chair_polyfon', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(255, 'table_polyfon', 'MO', 2, 2, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(256, 'smooth_table_polyfon', 'MO', 2, 2, '0,0,0', 1.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(257, 'table_polyfon_med', 'MO', 2, 2, '0,0,0', 0.7, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(258, 'table_polyfon_small', 'MO', 2, 2, '0,0,0', 0.5, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(259, 'shelves_polyfon', 'MO', 2, 1, '0,0,0', 3.2, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(260, 'fireplace_polyfon', 'M', 2, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(266, 'bench2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(267, 'bench', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(268, 'hedge7', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(269, 'hedge8', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(270, 'hedge2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(271, 'hedge9', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(272, 'hedge5', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(273, 'picnic_dummychair1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(274, 'picnic_ground', 'S', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(275, 'picnic_cloth1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(276, 'picnic_redbench2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(277, 'picnic_redbench1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(278, 'hedge6', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(279, 'hedge3', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(280, 'hedge4', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(281, 'picnic_bench1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(282, 'picnic_bench2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(283, 'picnic_bench3', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(284, 'picnic_dummychair4', 'S', 1, 0, '0', 0.0, 'S', 0, 4.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(285, 'picnic_dummychair6', 'S', 1, 0, '0', 0.0, 'S', 0, 7.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(286, 'picnic_stump', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(227, 'present_gen2', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(228, 'present_gen3', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(229, 'present_gen4', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(230, 'present_gen5', 'GOM', 1, 1, '0,0,0', 1.0, 'S', 0, 0.0, 0, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(231, 'prize1', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(232, 'prize3', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(233, 'typingmachine', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(234, 'giftflowers', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(235, 'plant_fruittree', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(236, 'plant_big_cactus', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(237, 'plant_bonsai', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(238, 'carpet_standard*7', 'POM', 3, 5, '#99CCFF,#99CCFF,#99CCFF', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(239, 'plant_pineapple', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(240, 'plant_yukka', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(241, 'plant_sunflower', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(242, 'plant_rose', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(243, 'plant_small_cactus', 'M', 1, 1, '0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(244, 'carpet_standard*1', 'POM', 3, 5, '#ff1f08', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(245, 'carpet_standard*6', 'POM', 3, 5, '#777777', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(246, 'carpet_soft*2', 'POM', 2, 4, '#66FFFF', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(247, 'carpet_soft*3', 'POM', 2, 4, '#FFCC99', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(248, 'carpet_soft*4', 'POM', 2, 4, '#FFCCFF', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(250, 'bottle', 'M', 1, 1, '0', 0.0, 'S', 8, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(261, 'poster', 'V', 0, 0, '516', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(262, 'poolchange', 'CPd', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(263, 'poolenter', 'CPeg', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(264, 'poolexit', 'CPfg', 1, 1, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(265, 'rare_daffodil_rug', 'POM', 2, 2, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(287, 'picnic_cloth2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(288, 'picnic_fireplace1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(289, 'picnic_fireplace2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(290, 'picnic_lemonade', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(291, 'picnic_firewood2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(292, 'picnic_firewood1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(293, 'picnic_carrot', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(294, 'picnic_table2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(295, 'picnic_table', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(296, 'hedge1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(297, 'picnic_cabbage', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(298, 'picnic_firewood3', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(299, 'mntdwchair', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(300, 'barmask', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(301, 'mntdwsofa2', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(302, 'mntdwtable2', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(303, 'mntdwsofa1', 'S', 1, 0, '0', 0.0, 'S', 0, 1.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(304, 'mntdwtable1', ' ', 1, 0, '0', 0.0, 'S', 0, 0.0, 0, 1)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(305, 'rare_beehive_bulb*1', 'M', 1, 1, '#ffffff,#ffffff,#ffffff,#ffffff,#ff4c47,#ffffff', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(306, 'hc_tbl', 'MO', 1, 3, '0,0,0', 1.3, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(310, 'mocchamaster', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(314, 'menorah', 'M', 1, 1, ' 0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(315, 'samovar', 'M', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(317, 'prizetrophy*1', 'M', 1, 1, '#ffffff,#ffffff,#FFDD3F', 0.0, 'S', 6, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(319, 'rare_stand', 'MS', 1, 1, '0,0,0', 0.0, 'S', 0, 1.9, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(320, 'hcamme', 'MS', 1, 2, '0,0,0', 8.5, 'S', 5, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(321, 'rare_parasol*3', 'M', 1, 1, '#ffffff,#ffffff,#ffffff,#d47fff', 0.0, 'S', 7, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(322, 'rare_fountain*2', 'M', 1, 1, '#ffffff,#ffffff,#b8cf00', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(325, 'club_sofa', 'MS', 2, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(326, 'rare_globe', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(327, 'hc_lmp', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(328, 'birdie', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(332, 'prizetrophy7*1', 'M', 1, 1, '#ffffff,#ffffff,#FFDD3F', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(341, 'rare_icecream*8', 'M', 1, 1, '0,0,0', 0.0, 'S', 4, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(342, 'scifirocket*7', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(346, 'poster', 'V', 0, 0, '45', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(347, 'poster', 'V', 0, 0, '19', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(349, 'carpet_polar*3', 'POM', 2, 3, '#ffef9c,#ffef9c,#ffef9c', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(350, 'carpet_polar*4', 'POM', 2, 3, '#caea9c,#caea9c,#caea9c', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(352, 'shelves_basic', 'M', 2, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(353, 'bar_basic', 'M', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(354, 'fridge', 'M', 1, 1, '0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(355, 'lamp_basic', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(356, 'heartsofa', 'MS', 2, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(357, 'valentinescreen', 'SM', 2, 1, '0,0,0', 0.0, 'S', 0, 1.1, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(358, 'joulutahti', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(359, 'plant_cruddy', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(360, 'duck', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(361, 'statue', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(307, 'hc_dsk', 'M', 1, 2, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(308, 'hc_chr', 'SM', 1, 1, '0,0,0', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(309, 'skullcandle', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(311, 'edicehc', 'M', 1, 1, ' ', 0.0, 'S', 3, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(312, 'bar_polyfon', 'MZX', 1, 1, ' 0,0,0', 0.0, 'S', 3, 1.5, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(313, 'doorD', 'MZX', 1, 1, ' 0,0,0', 0.0, 'S', 1, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(316, 'hc_dsk', 'M', 1, 2, ' 0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(318, 'poster', 'V', 0, 0, '2005', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(323, 'rare_elephant_statue*1', 'M', 1, 1, '#ffffff,#bfbfbf/', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(324, 'rare_elephant_statue*2', 'M', 1, 1, '#ffffff,#d46b00', 0.0, 'S', 7, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(329, 'birdie', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(330, 'rcandleset', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(331, 'rcandle', 'M', 1, 1, '0,0,0', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(333, 'rare_fountain*1', 'M', 1, 1, '#ffffff,#ffffff,#ffffff', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(334, 'house', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(335, 'rare_fountain', 'M', 1, 1, '#ffffff,#ffffff,#ff6666', 0.0, 'S', 5, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(336, 'carpet_standard*6', 'MOP', 3, 5, '#00000', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(337, 'poster', 'V', 0, 0, '1004', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(338, 'md_limukaappi', 'M', 1, 1, '0,0,0', 0.0, 'S', 4, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(339, 'scifiport*9', 'M', 1, 1, '0,0,0', 0.0, 'S', 2, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(340, 'pillow*2', 'MS', 1, 1, '#ffffff,#ffffff,#ffffff,#d47fff', 0.0, 'S', 0, 1.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(343, 'poster', 'V', 0, 0, '29', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(344, 'poster', 'V', 0, 0, '46', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(345, 'poster', 'V', 0, 0, '48', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(348, 'carpet_polar*2', 'POM', 2, 3, '#bacaec,#bacaec,#bacaec', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(351, 'djesko_turntable', 'M', 1, 1, '0,0,0', 0.0, 'S', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(362, 'poster', 'V', 0, 0, '47', 0.0, 'I', 0, 0.0, 1, 0)
GO
INSERT INTO FurniDefinitions (FurniDefinitionID, Sprite, Flags, W, L, Col, HeightOffset, HandType, VarType, ActionHeight, CanTrade, PublicFurni)
VALUES(363, 'poster', 'V', 0, 0, '49', 0.0, 'I', 0, 0.0, 1, 0)
GO

-- Disable identity insert
SET IDENTITY_INSERT FurniDefinitions OFF
GO



-- Dumping data for table 'GameConfig'
--

-- Enable identity insert
SET IDENTITY_INSERT GameConfig ON
GO

INSERT INTO GameConfig (ConfigVersion, DatabaseVersion)
VALUES(1, 1)
GO

-- Disable identity insert
SET IDENTITY_INSERT GameConfig OFF
GO

-- Dumping data for table 'RoleAccess'
--

-- Enable identity insert
SET IDENTITY_INSERT RoleAccess ON
GO

INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(26, 1, 'default')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(27, 1, 'fuse_login')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(28, 1, 'fuse_use_club_outfits')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(29, 1, 'fuse_room_queue_default')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(30, 1, 'fuse_buy_credits')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(31, 1, 'fuse_trade')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(32, 2, 'fuse_use_club_badge')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(33, 2, 'fuse_room_queue_club')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(34, 2, 'fuse_use_club_dance')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(35, 2, 'fuse_priority_access')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(36, 2, 'fuse_furni_chooser')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(37, 3, 'fuse_enter_full_rooms')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(38, 4, 'fuse_cannot_get_kicked')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(41, 4, 'fuse_enter_full_rooms')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(42, 5, 'fuse_cannot_get_kicked')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(44, 5, 'fuse_mute')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(45, 6, 'fuse_kick')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(46, 6, 'fuse_alert')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(47, 6, 'thor_moderator')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(48, 7, 'fuse_ban')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(49, 7, 'fuse_enter_locked_rooms')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(50, 8, 'fuse_any_room_rights')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(51, 8, 'fuse_room_kick')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(52, 8, 'fuse_room_alert')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(53, 8, 'fuse_room_mute')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(54, 8, 'fuse_see_all_roomowners')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(55, 9, 'fuse_any_room_controller')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(56, 10, 'fuse_see_system_categories')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(57, 10, 'fuse_staff_catalogue')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(58, 10, 'fuse_admin_servcast')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(59, 7, 'fuse_cfh')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(60, 2, 'fuse_habbo_chooser')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(61, 7, 'fuse_housekeeping_login')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(62, 7, 'fuse_housekeeping_cats_users')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(63, 7, 'fuse_housekeeping_user_lookup')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(64, 10, 'fuse_housekeeping_user_changerole')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(65, 9, 'fuse_housekeeping_user_changename')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(66, 10, 'fuse_housekeeping_user_changeclub')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(67, 10, 'fuse_housekeeping_user_changecredits')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(68, 10, 'fuse_housekeeping_cats_economy')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(69, 10, 'fuse_housekeeping_economy_createvoucher')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(70, 9, 'fuse_housekeeping_user_referraltool')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(72, 7, 'fuse_housekeeping_cats_moderation')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(73, 10, 'fuse_housekeeping_economy_spawnfurni')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(74, 7, 'fuse_whereis')
GO
INSERT INTO RoleAccess (RoleAccessID, RoleID, RightName)
VALUES(75, 7, 'fuse_who')
GO

-- Disable identity insert
SET IDENTITY_INSERT RoleAccess OFF
GO



-- Dumping data for table 'Roles'
--
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(1, 'User', 0)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(2, 'Habbo Club', 1)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(3, 'HabboX', 2)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(4, 'VIP', 2)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(5, 'Event Organiser', 3)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(6, 'Trainee Hobba', 5)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(7, 'Gold Hobba', 6)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(8, 'Supervisor Hobba', 7)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(9, 'Moderator', 8)
GO
INSERT INTO Roles (RoleID, RoleName, InheritRole)
VALUES(10, 'Administrator', 9)
GO


-- Dumping data for table 'RoomCategories'
--
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(3, 'Rooms in Asgard', 0, 0, 0, 1, 0, 0, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(4, 'Rooms in Midgard', 0, 2, 0, 1, 0, 0, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(5, 'No Category', 4, 2, 1, 0, 1, 0, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(6, 'Staff Reccomended Rooms', 4, 2, 1, 1, 0, 0, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(7, 'Trade Rooms', 4, 2, 1, 1, 1, 20, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(8, 'Outside Spaces', 3, 0, 0, 1, 0, 0, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(9, 'System Rooms (Invisible)', 3, 0, 1, 0, 0, 100, 1)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(10, 'Unfinished', 9, 0, 1, 0, 0, 101, 1)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(11, 'Room Parts', 9, 0, 1, 0, 0, 102, 1)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(12, 'Events', 9, 0, 1, 0, 0, 103, 1)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(13, 'Chat, Chill & Discussion Rooms', 4, 2, 0, 1, 1, 10, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(14, 'Casinos', 4, 2, 1, 1, 1, 20, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(16, 'Help Rooms', 4, 2, 0, 1, 1, 30, 0)
GO
INSERT INTO RoomCategories (RoomCategoryID, RoomCategoryName, RoomCategoryParent, RoomCategoryType, CanTrade, IsVisible, PlayerCategory, CategoryOrder, SystemCategory)
VALUES(17, 'Game Rooms', 4, 2, 0, 1, 1, 40, 0)
GO

-- Dumping data for table 'Rooms'
--

-- Enable identity insert
SET IDENTITY_INSERT RoomTypes ON
GO

INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(1, 'Guest Model A', 'model_a', 'xxxxxxxxxxxx|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxx00000000|xxxxxxxxxxxx|xxxxxxxxxxxx', 3, 5, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(2, 'Public Welcome Lounge', 'newbie_lobby', 'xxxxxxxxxxxxxxxx000000|xxxxx0xxxxxxxxxx000000|xxxxx00000000xxx000000|xxxxx000000000xx000000|0000000000000000000000|0000000000000000000000|0000000000000000000000|0000000000000000000000|0000000000000000000000|xxxxx000000000000000xx|xxxxx000000000000000xx|x0000000000000000000xx|x0000000000000000xxxxx|xxxxxx00000000000xxxxx|xxxxxxx0000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxxxx000000000xxxxx|xxxxxx00000000000xxxxx|xxxxxx00000000000xxxxx|xxxxxx00000000000xxxxx|xxxxxx00000000000xxxxx|xxxxxx00000000000xxxxx|xxxxx000000000000xxxxx|xxxxx000000000000xxxxx', 2, 11, 0, 0, 'PublicReactor', 'hh_room_nlobby', 0, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(4, 'Public Lido A', 'pool_a', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx7xxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx777xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxx7777777xxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx777777777xxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx7xxx777777xxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx7x777777777xxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx7xxx77777777xxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx7x777777777x7xxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx7xxx7777777777xxxxxxxxxxxxxx|xxxxxxxxxxxxxxx777777777777xxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx77777777777x2111xxxxxxxxxxxx|xxxxxxxxxxxxxxx7777777777x221111xxxxxxxxxxx|xxxxxxxxx7777777777777777x2211111xxxxxxxxxx|xxxxxxxxx7777777777777777x22211111xxxxxxxxx|xxxxxxxxx7777777777777777x222211111xxxxxxxx|xxxxxx77777777777777777777x222211111xxxxxxx|xxxxxx7777777xx777777777777x222211111xxxxxx|xxxxxx7777777xx77777777777772222111111xxxxx|xxxxxx777777777777777777777x22221111111xxxx|xx7777777777777777777777x322222211111111xxx|77777777777777777777777x33222222111111111xx|7777777777777777777777x333222222211111111xx|xx7777777777777777777x333322222222111111xxx|xx7777777777777777777333332222222221111xxxx|xx777xxx777777777777733333222222222211xxxxx|xx777x7x77777777777773333322222222222xxxxxx|xx777x7x7777777777777x33332222222222xxxxxxx|xxx77x7x7777777777777xx333222222222xxxxxxxx|xxxx77777777777777777xxx3222222222xxxxxxxxx|xxxxx777777777777777777xx22222222xxxxxxxxxx|xxxxxx777777777777777777x2222222xxxxxxxxxxx|xxxxxxx777777777777777777222222xxxxxxxxxxxx|xxxxxxxx7777777777777777722222xxxxxxxxxxxxx|xxxxxxxxx77777777777777772222xxxxxxxxxxxxxx|xxxxxxxxxx777777777777777222xxxxxxxxxxxxxxx|xxxxxxxxxxx77777777777777x2xxxxxxxxxxxxxxxx|xxxxxxxxxxxx77777777777777xxxxxxxxxxxxxxxxx|xxxxxxxxxxxxx777777777777xxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxx7777777777xxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxx777777xxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx7777xxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxx77xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 2, 25, 7, 0, 'LidoReactor', 'hh_room_pool,hh_people_pool', 0, 1.5, 3.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(5, 'Guest Model B', 'model_b', 'xxxxxxxxxxxx|xxxxx0000000|xxxxx0000000|xxxxx0000000|xxxxx0000000|x00000000000|x00000000000|x00000000000|x00000000000|x00000000000|x00000000000|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx', 0, 5, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(6, 'Guest Model C', 'model_c', 'xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx', 4, 7, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(7, 'Guest Model D', 'model_d', 'xxxxxxxxxxxx|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxx000000x|xxxxxxxxxxxx', 4, 7, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(8, 'Guest Model E', 'model_e', 'xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xx0000000000|xx0000000000|xx0000000000|xx0000000000|xx0000000000|xx0000000000|xx0000000000|xx0000000000|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx', 1, 5, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(9, 'Guest Model F', 'model_f', 'xxxxxxxxxxxx|xxxxxxx0000x|xxxxxxx0000x|xxx00000000x|xxx00000000x|xxx00000000x|xxx00000000x|x0000000000x|x0000000000x|x0000000000x|x0000000000x|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx', 2, 5, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(11, 'Public Library', 'library', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxx11111xx1xx1x111111x|xxxxxxxxxxxx111111xx1xx11111111x|xx111xxxxxxx111111xx1xx11111111x|xx111xxxxxxx1111111111111111111x|xx111xxxxxxx1111111111111111111x|xx111xxxxxxx1111111111111111111x|xx111xxxxxxx1111111111111xxxxxxx|xx111xxxxxx11111111111111111111x|xx111xxxxxx11111111111111111111x|xx111xxxxxx11111111111111111111x|xx111xxxxxx11111111111111xxxxxxx|xx111xxxxxxxx111111111111111111x|xx111xx11111x111111111111111111x|xx111xx11111x111111111111111111x|xx111xxxxx11x11111111x111xxxxxxx|xx111xxxxxxxx11111111xx11111111x|xx111xxx1111111111111xxx1111111x|xx111xxx1111111111111xxxx111111x|xxx111xx1111111111x11xxxx000000x|xxxxx1111xx1111111x11xxxx000000x|xxxxxxxxxxxx111111x11xxxx000000x|xxxxxxxxxxxx11xx11x11xxxx000000x|xxxxxxxxxxxx11xx11x11xxxx000000x|xxxxxxxxxxxx11xx11x11xxxx000000x|xxxxxxxxxxxx11xx11x11xxxx000000x|xxxxxxxxxxxx11xx11x11xxxx000000x|xxxxxxxxxxxx11xx11x111xxx000000x|xxxxxxxxxxxxxxxxxxxx11xxx000000x|xxxxxxxxxxxxxxxxxxxx11xxxxxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxx22222xxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 20, 3, 1, 0, 'PublicReactor', 'hh_room_library', 0, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(12, 'Public Port', 'floatinggarden', 'xxxxxxxxxxxxxxxx333333xxxxxxxxx|xxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx|xxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx|xxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx|xxxxxxxxxxxxxxx223xxx33xxxxxxxx|xxxxxxxxxxxxxxx11xxx33333xxxxxx|xxxxxxxxxxxxxxxx11xx3333333xxxx|xxxxxxxxxxxxxxxx11xx33333333xxx|xxxxxxxxxxxxxxxxx11xxxxxxxx3xxx|xxxxxxxxxxxxxxxxxx11xxxx3333xxx|xxxxxxxxxxxxxxxxxxx1xxxx33333xx|xxxxxxxxxxxxxxxxxxx1xxx3333333x|555xxxxxxxxxxx1111111x333333333|555xxxxxxxxxxx21111111xxxxxx333|555xxxxxxxxxxx22111111111xxxxxx|555xxxxxxxxxxx222xxxxxxx111xxxx|555xxxxxxxxxxx22xxxxxxxxxx1xxxx|555xxxxxxxxxxx23333333333x111xx|555xxxxxxxx33333333333333x111xx|555xxxxxxxx333333x3333333x111xx|555xxxxxxxx33333333333333x111xx|555xxxxxxxx33x33333333333x111xx|555xxxxxxxx33x33x33333333x111xx|555xxxxxxxx33x33x33333333x111xx|5554333333333x333x3333333x111xx|x554333333xxxx33xxxxxxxxxx111xx|xxxxxxxxx3xxxx333221111111111xx|xxxxxxxxx3xxxx333221111111111xx|xxxxxxxxx33333333xx1111x11x11xx|xxxxxxxxx33333333111xxx11xxxxxx|xxxxxxxxxxxxxx33311xxxx11xxxxxx|xxxxxxxxxxxxxx33311xxxx11xxxxxx|xxxxxxxxxxxxxx333x1xxxx11xxxxxx|xxxxxxxxxxxxxx333x1xx111111xxxx|xxxxxxxxxxxxxx33311xx111111xxxx|xxxxxxxxxx333333311xx111111xxxx|xxxxxxxxxxx33333311xx111111xxxx|xxxxxxxxxxxxxxxx111xxxxxxxxxxxx|xxxxxxxxxxxxxxx111xxxxxxxxxxxxx', 2, 21, 5, 0, 'PublicReactor', 'hh_room_floatinggarden', 0, 1.5, 1.5)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(13, 'Guest Model G', 'model_g', 'xxxxxxxxxxxxx|xxxxxxxxxxxxx|xxxxxxx00000x|xxxxxxx00000x|xxxxxxx00000x|xx1111000000x|xx1111000000x|xx1111000000x|xx1111000000x|xx1111000000x|xxxxxxx00000x|xxxxxxx00000x|xxxxxxx00000x|xxxxxxxxxxxxx|xxxxxxxxxxxxx|xxxxxxxxxxxxx|xxxxxxxxxxxxx', 1, 7, 1, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(14, 'Guest Model H', 'model_h', 'xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxx111111x|xxxxx111111x|xxxxx111111x|xxxxx111111x|xxxxx111111x|xxxxx000000x|xxxxx000000x|xxx00000000x|xxx00000000x|xxx00000000x|xxx00000000x|xxxxxxxxxxxx|xxxxxxxxxxxx|xxxxxxxxxxxx', 4, 4, 1, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(16, 'Guest Model J', 'model_j', 'xxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxx', 0, 10, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(17, 'Guest Model K', 'model_k', 'xxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx00000000|xxxxxxxxxxxxxxxxx00000000|xxxxxxxxxxxxxxxxx00000000|xxxxxxxxxxxxxxxxx00000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|x000000000000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxxxxxxxxxxxxxxxxxx', 0, 13, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(18, 'Guest Model L', 'model_l', 'xxxxxxxxxxxxxxxxxxxxx|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|x00000000xxxx00000000|xxxxxxxxxxxxxxxxxxxxx', 0, 16, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(19, 'Guest Model M', 'model_m', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|x0000000000000000000000000000|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxx00000000xxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 0, 15, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(20, 'Guest Model N', 'model_n', 'xxxxxxxxxxxxxxxxxxxxx|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x000000xxxxxxxx000000|x000000x000000x000000|x000000x000000x000000|x000000x000000x000000|x000000x000000x000000|x000000x000000x000000|x000000x000000x000000|x000000xxxxxxxx000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|xxxxxxxxxxxxxxxxxxxxx', 0, 16, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(21, 'Guest Model O', 'model_o', 'xxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx11111111xxxx|xxxxxxxxxxxxx00000000xxxx|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|x111111100000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxx0000000000000000|xxxxxxxxxxxxxxxxxxxxxxxxx', 0, 18, 1, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(22, 'Guest Model P', 'model_p', 'xxxxxxxxxxxxxxxxxxx|xxxxxxx222222222222|xxxxxxx222222222222|xxxxxxx222222222222|xxxxxxx222222222222|xxxxxxx222222222222|xxxxxxx222222222222|xxxxxxx22222222xxxx|xxxxxxx11111111xxxx|x222221111111111111|x222221111111111111|x222221111111111111|x222221111111111111|x222221111111111111|x222221111111111111|x222221111111111111|x222221111111111111|x2222xx11111111xxxx|x2222xx00000000xxxx|x2222xx000000000000|x2222xx000000000000|x2222xx000000000000|x2222xx000000000000|x2222xx000000000000|x2222xx000000000000|xxxxxxxxxxxxxxxxxxx', 0, 23, 2, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(23, 'Guest Model Q', 'model_q', 'xxxxxxxxxxxxxxxxxxx|xxxxxxxxxxx22222222|xxxxxxxxxxx22222222|xxxxxxxxxxx22222222|xxxxxxxxxxx22222222|xxxxxxxxxxx22222222|xxxxxxxxxxx22222222|x222222222222222222|x222222222222222222|x222222222222222222|x222222222222222222|x222222222222222222|x222222222222222222|x2222xxxxxxxxxxxxxx|x2222xxxxxxxxxxxxxx|x2222211111xx000000|x222221111110000000|x222221111110000000|x2222211111xx000000|xx22xxx1111xxxxxxxx|xx11xxx1111xxxxxxxx|x1111xx1111xx000000|x1111xx111110000000|x1111xx111110000000|x1111xx1111xx000000|xxxxxxxxxxxxxxxxxxx', 10, 4, 2, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(24, 'Guest Model R', 'model_r', 'xxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxx33333333333333|xxxxxxxxxxx33333333333333|xxxxxxxxxxx33333333333333|xxxxxxxxxxx33333333333333|xxxxxxxxxxx33333333333333|xxxxxxxxxxx33333333333333|xxxxxxx333333333333333333|xxxxxxx333333333333333333|xxxxxxx333333333333333333|xxxxxxx333333333333333333|xxxxxxx333333333333333333|xxxxxxx333333333333333333|x4444433333xxxxxxxxxxxxxx|x4444433333xxxxxxxxxxxxxx|x44444333333222xx000000xx|x44444333333222xx000000xx|xxx44xxxxxxxx22xx000000xx|xxx33xxxxxxxx11xx000000xx|xxx33322222211110000000xx|xxx33322222211110000000xx|xxxxxxxxxxxxxxxxx000000xx|xxxxxxxxxxxxxxxxx000000xx|xxxxxxxxxxxxxxxxx000000xx|xxxxxxxxxxxxxxxxx000000xx|xxxxxxxxxxxxxxxxxxxxxxxxx', 10, 4, 3, 1, 'FlatReactor', '0', 2, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(29, 'Habbo Park', 'park_a', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxxxxx|xxxxxxxxxxxxx0x00xxxxxxxxxxx0x000xxxxxxxxxxx|xxxxxxxxxxxx0000000000000000000000xxxxxxxxxx|xxxxxxxxxxx000000000000000000000000xxxxxxxxx|xxxxxxxxxxx0000000000000000000000000xxxxxxxx|xxxxxxxxxxx00000000000000000000000000xxxxxxx|xxxxxxxx000000000000000000000000000000xxxxxx|xxxxxxx00000000000000000000000000000000xxxxx|xxxxxxx000000000000000000000000000000000xxxx|xxxxxxx0000000000000000000000000000000000xxx|xxxxxxxxx000000000000000000000000000000000xx|00000000000000000000xx00000000000000000000xx|0000000000000000000xxxx00000000000xxxxxxx0xx|0000000000000000000xxxx00000000000x00000xxxx|xxxxx00x0000000000xxxxx0xxxxxx0000x0000000xx|xxxxx0000000000000xxxxx0xx000x0000x000000xxx|xxxxx0000000000000xxxxx0x000000000x00000xxxx|xxxxx000000x0000000xxxx0x000000000xxx00xxxxx|xxxxxxxx000x0000000xxx00xxx000000x0000xxxxxx|xxxxxxxx000x000000xxxx0x0000000000000xxxxxxx|xxxxxxxx000x000000011100000000000000xxxxxxxx|xxxxxxxx000x00000001110000000000000xxxxxxxxx|xxxxxxxxx00x0000000111x00000000x00xxxxxxxxxx|xxxxxxxxxx0x0000000xxx0000000xxxxxxxxxxxxxxx|xxxxxxxxxxxx000000xxxx0000000xxxxxxxxxxxxxxx|xxxxxxxxxxxx000000xxx00xxxxx00xxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0xx000x00xxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0x000000xxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0x00000xxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxxxx00xxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxxxx0xxxxxxxxxxxxxxxxxxxx', 2, 15, 0, 0, 'PublicReactor', 'hh_room_park_general,hh_room_park', 0, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(15, 'Guest Model I', 'model_i', 'xxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|xxxxxxxxxxx0000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x00000000000000000000|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|x0000000000xxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxx', 0, 10, 0, 1, 'FlatReactor', '0', 1, 1.5, 4.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(28, 'Public theatredrome', 'theater', 'xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxx|xxxxxxx111111111xxxxxxx|xxxxxxx11111111100000xx|xxxx00x11111111100000xx|xxxx00x11111111100000xx|4xxx00x11111111100000xx|4440000xxxxxxxxx00000xx|444000000000000000000xx|4xx000000000000000000xx|4xx0000000000000000000x|44400000000000000000000|44400000000000000000000|44x00000000000000000000|44x11111111111111111000|44x11111111111111111000|33x11111111111111111000|22x11111111111111111000|22x11111111111111111000|22x11111111111111111000|22x11111111111111111000|22x11111111111111111000|22211111111111111111000|22211111111111111111000|xxxxxxxxxxxxxxxxxxxx00x|xxxxxxxxxxxxxxxxxxxx00x', 20, 27, 0, 0, 'PublicReactor', 'hh_room_theater', 0, 1.5, 3.0)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(30, 'Public Picnic', 'picnic', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xx22222xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|22xxxxxxxxxxxxx22xxxxxxxxxxxxxxxxxxxxx|2222222222222222222x222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222xxx222222222222222222222222|2222222222xx33x22222222222222222222222|222222222xx3333x2222222222222222222222|222222222x333333x222222222222222222222|222222222x333333x222222222222222222222|2222222222x3332x2222222222222222222222|22222222222x33x22222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222x22222xxxx22222222222222222222|22222222222222xxxx22222222222222222222|22222222222222xxx222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222|22222222222222222222222222222222222222', 16, 5, 2, 0, 'PublicReactor', 'hh_room_picnic', 0, 1.5, 1.5)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(31, 'Public Rumble', 'md_a', 'xxxxxxxx77xxxxxxxxxxxxxxxx|xxxxxxxx77xxxxxxxxxxxxxxxx|xxxxxx77777x77xxxxxxxxxxxx|xxx77777777777xxx44xxxxxxx|77777777777777xx444444444x|777777777777777xx44444444x|xxx777777777777xx44444444x|xxxx7777777777xxx44444444x|7777777777777777744444444x|7777777777777x4x744444444x|777777777777x444444444444x|7777777777774444444444444x|7777777777774444444444444x|777777777777x444444444444x|7777777777777x44444444444x|xxx777777777777x444444444x|xxx7777777777777444444444x|xxx7777777777777444444444x|xxx777777777777x444444444x|xxx77777777777x4444444444x|xxxx777777777444444444444x|xxxxxxxxxxxxxxxxxxxxxxxxxx', 1, 5, 7, 0, 'RooftopReactor', 'hh_room_terrace,hh_paalu,hh_people_pool,hh_people_paalu', 0, 1.5, 1.5)
GO
INSERT INTO RoomTypes (RoomTypeID, FriendlyName, RoomModel, DefaultHeightmap, StartX, StartY, StartZ, Guest, ReactorType, CCTS, UserType, MaxAscend, MaxDescend)
VALUES(32, 'Public infobus', 'park_b', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxx|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxxxxx|xxxxxxxxxxxxx0x00xxxxxxxxxxx0x000xxxxxxxxxxx|xxxxxxxxxxxx0000000000000000000000xxxxxxxxxx|xxxxxxxxxxx000000000000000000000000xxxxxxxxx|xxxxxxxxxxx0000000000000000000000000xxxxxxxx|xxxxxxxxxxx00000000000000000000000000xxxxxxx|xxxxxxxx000000000000000000000000000000xxxxxx|xxxxxxx00000000000000000000000000000000xxxxx|xxxxxxx000000000000000000000000000000000xxxx|xxxxxxx0000000000000000000000000000000000xxx|xxxxxxxxx000000000000000000000000000000000xx|00000000000000000000xx00000000000000000000xx|0000000000000000000xxxx00000000000xxxxxxx0xx|0000000000000000000xxxx00000000000x00000xxxx|xxxxx00x0000000000xxxxx0xxxxxx0000x0000000xx|xxxxx0000000000000xxxxx0xx000x0000x000000xxx|xxxxx0000000000000xxxxx0x000000000x00000xxxx|xxxxx000000x0000000xxxx0x000000000xxx00xxxxx|xxxxxxxx000x0000000xxx00xxx000000x0000xxxxxx|xxxxxxxx000x000000xxxx0x0000000000000xxxxxxx|xxxxxxxx000x000000011100000000000000xxxxxxxx|xxxxxxxx000x00000001110000000000000xxxxxxxxx|xxxxxxxxx00x0000000111x00000000x00xxxxxxxxxx|xxxxxxxxxx0x0000000xxx0000000xxxxxxxxxxxxxxx|xxxxxxxxxxxx000000xxxx0000000xxxxxxxxxxxxxxx|xxxxxxxxxxxx000000xxx00xxxxx00xxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0xx000x00xxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0x000000xxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxx0x00000xxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxxxx00xxxxxxxxxxxxxxxxxxx|xxxxxxxxxxxxxxxxx0xxxxx0xxxxxxxxxxxxxxxxxxxx', 2, 15, 0, 0, 'PublicReactor', 'hh_room_park_general,hh_room_park', 0, 1.5, 1.5)
GO

-- Disable identity insert
SET IDENTITY_INSERT RoomTypes OFF
GO



-- Dumping data for table 'Users'
--

-- Enable identity insert
SET IDENTITY_INSERT Users ON
GO

INSERT INTO Users (UserID, Username, Password, figure, sex, mission, email, dob, credits, tickets, roleid, poolfigure, ClubDaysRemaining, ClubMonthsPassed, ClubMonthsRemaining, ClubLastUpdate, LastLogin, CurrentBadge, LastIP)
VALUES(1, 'Admin', 'admin', '8000518001281013050180505', 'M', '', 'admin@user.com', '01.01.1901', 4, 100, 10, 'ch=s02/253,146,160', 31, 0, 1, 'Jul 24 2008  8:29AM', 'Jul 29 2008  5:34PM', 'ADM', '84.215.128.69')

-- Disable identity insert
SET IDENTITY_INSERT Users OFF
GO
