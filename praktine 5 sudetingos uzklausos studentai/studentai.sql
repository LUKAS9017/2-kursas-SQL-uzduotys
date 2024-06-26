create database studentai
go
use studentai
go

CREATE TABLE [dbo].[dest](
	[id] [int] NOT NULL primary key,
	[vardas] [nvarchar](30) NOT NULL,
	[pavarde] [nvarchar](30) NOT NULL
)
GO
CREATE TABLE [dbo].[dalykas](
	[id] [int] NOT NULL primary key,
	[pavadinimas] [nvarchar](50) NOT NULL,
	[sk_sav] [int] NOT NULL,
	[dest_id] [int] NULL references dest(id)
)
GO

CREATE TABLE [dbo].[grupe](
	[id] [int] NOT NULL primary key,
	[sifras] [nvarchar](10) NOT NULL,
	[grupe] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL primary key,
	[vardas] [nvarchar](30) NOT NULL,
	[pavarde] [nvarchar](30) NOT NULL,
	[gim_data] [date] NOT NULL,
	[adresas] [nvarchar](30) NOT NULL,
	[telefonas] [nvarchar](15) NULL,
	[grupe_id] [int] NULL references grupe(id)
)
GO
CREATE TABLE [dbo].[vertinimas](
	[id] [int] NOT NULL primary key,
	[stud_id] [int] NULL references student(id),
	[dal_id] [int] NULL references dalykas(id),
	[paz] [real] NOT NULL,
	[data] [date] NOT NULL,
	[pastabos] [text] NULL
)
GO
INSERT [dbo].[dest] ([id], [vardas], [pavarde]) VALUES (1, N'Linas', N'Pirmasis')
INSERT [dbo].[dest] ([id], [vardas], [pavarde]) VALUES (2, N'Aloyzas', N'Antrasis')
INSERT [dbo].[dest] ([id], [vardas], [pavarde]) VALUES (3, N'Regimantas', N'Trečiasis')
INSERT [dbo].[dest] ([id], [vardas], [pavarde]) VALUES (4, N'Pijus', N'Ketvirtasis')
INSERT [dbo].[dest] ([id], [vardas], [pavarde]) VALUES (5, N'Petras', N'Penktasis')

INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (1, N'IT', 3, 1)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (2, N'DB valdymas', 4, 2)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (3, N'Tinklai', 2, 3)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (4, N'Matematika', 2, 4)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (5, N'Filosofija', 1, 5)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (6, N'Psichologija', 2, 5)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (7, N'Emocijų valdymas', 2, 5)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (8, N'Programavimas', 3, 2)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (9, N'OS', 3, 3)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (10, N'IS', 2, 2)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (11, N'Ieška internete', 2, 1)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (12, N'HTML', 3, 2)
INSERT [dbo].[dalykas] ([id], [pavadinimas], [sk_sav], [dest_id]) VALUES (13, N'TVS', 3, 2)

INSERT [dbo].[grupe] ([id], [sifras], [grupe]) VALUES (1, N'MT', N'multimedijos')
INSERT [dbo].[grupe] ([id], [sifras], [grupe]) VALUES (2, N'IST', N'informacinių sistemų technologija')
INSERT [dbo].[grupe] ([id], [sifras], [grupe]) VALUES (3, N'PV', N'prekybos vadyba')
INSERT [dbo].[grupe] ([id], [sifras], [grupe]) VALUES (4, N'VI', N'verslo informatika')

INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (1, N'Anzelmas', N'Pirmokas', CAST(0x0D080B00 AS Date), N'Tilžės 11', NULL, 1)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (2, N'Konstantinas', N'Antrokas', CAST(0xFC170B00 AS Date), N'Maironio 12 - 23', NULL, 1)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (3, N'Sigis', N'Trečiokas', CAST(0xA9190B00 AS Date), N'Maironio 13-14', NULL, 1)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (4, N'Romanas', N'Ketvirtokas', CAST(0xF7FC0A00 AS Date), N'Liepų 15', NULL, 2)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (5, N'Stasys', N'Penktokas', CAST(0x351A0B00 AS Date), N'Tilžės 27-23', NULL, 2)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (6, N'Marijus', N'Šeštokas', CAST(0xF0180B00 AS Date), N'Tilžės 15-234', NULL, 2)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (7, N'Ramūnas', N'Septintokas', CAST(0x8F190B00 AS Date), N'Kauno 23', NULL, 2)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (8, N'Kęstutis', N'Aštuntokas', CAST(0xB0160B00 AS Date), N'Kauno 15-12', NULL, 3)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (9, N'Eugenijus', N'Devintokas', CAST(0x91160B00 AS Date), N'Gegužių 93-23', NULL, 3)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (10, N'Augustinas', N'Dešimtokas', CAST(0xAE190B00 AS Date), N'Rugių 12', NULL, 4)
INSERT [dbo].[student] ([id], [vardas], [pavarde], [gim_data], [adresas], [telefonas], [grupe_id]) VALUES (11, N'Faustas', N'Vienuoliktokas', CAST(0xBB140B00 AS Date), N'Gegužių 37-14', NULL, 4)

INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (1, 1, 1, 10, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (2, 2, 1, 9, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (3, 3, 1, 8, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (4, 4, 1, 7, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (5, 5, 1, 7, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (6, 6, 1, 5, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (7, 7, 1, 5, CAST(0x58360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (8, 1, 2, 9, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (9, 2, 2, 6, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (10, 3, 2, 5, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (11, 4, 2, 7, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (12, 5, 2, 6, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (13, 6, 2, 6, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (14, 7, 2, 5, CAST(0x54360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (15, 8, 6, 9, CAST(0x52360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (16, 9, 6, 9, CAST(0x52360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (17, 10, 6, 9, CAST(0x52360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (18, 11, 6, 9, CAST(0x52360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (19, 8, 7, 10, CAST(0x52360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (20, 8, 8, 7, CAST(0x5A360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (21, 10, 5, 8, CAST(0x5A360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (22, 11, 5, 8, CAST(0x5A360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (23, 11, 6, 8, CAST(0x5A360B00 AS Date), NULL)
INSERT [dbo].[vertinimas] ([id], [stud_id], [dal_id], [paz], [data], [pastabos]) VALUES (24, 11, 7, 10, CAST(0x5A360B00 AS Date), NULL)
