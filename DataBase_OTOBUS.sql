CREATE DATABASE OTOBUSDB
GO
USE OTOBUSDB
GO
CREATE TABLE Sefer_Tablosu
(
SehirID					INT				PRIMARY KEY				IDENTITY(1,1),
Sehir					NVARCHAR(13)
)
GO
CREATE TABLE OtobusBilgi_Tablosu
(
OtobusID				INT				PRIMARY KEY				IDENTITY(1,1),
OtobusModel				NVARCHAR(20)	UNIQUE,
OtobusPlaka				NVARCHAR(10)	UNIQUE
)
GO
CREATE TABLE Koltuklar_Tablosu
(
KoltukID				INT				PRIMARY KEY				IDENTITY(1,1),
FiyatBilgisi			DECIMAL(18,2)
)
GO
CREATE TABLE OtobusKoltukDuzeni_Tablosu
(
RezervID				INT				PRIMARY KEY,
OtobusID				INT				FOREIGN KEY				REFERENCES OtobusBilgi_Tablosu(OtobusID),
KoltukID				INT				FOREIGN KEY				REFERENCES Koltuklar_Tablosu(KoltukID)
)
GO
CREATE TABLE Cinsiyet_Tablosu
(
CinsiyetID				INT				PRIMARY KEY				IDENTITY(1,1),
Cinsiyet				NVARCHAR(10)	UNIQUE
)
GO
CREATE TABLE SeferBilgisi_Tablosu
(
InfoID					INT				PRIMARY KEY				IDENTITY(1,1),
RezervID				INT				FOREIGN KEY				REFERENCES OtobusKoltukDuzeni_Tablosu(RezervID),
KalkisYeriID			INT				FOREIGN KEY				REFERENCES Sefer_Tablosu(SehirID),
VarisYeriID				INT				FOREIGN KEY				REFERENCES Sefer_Tablosu(SehirID),
CinsiyetID				INT				FOREIGN KEY				REFERENCES Cinsiyet_Tablosu(CinsiyetID),
AdSoyad					NVARCHAR(50)
)
GO
CREATE TABLE GünlükRapor
(
RaporID					INT				PRIMARY KEY				IDENTITY(1,1),
OtobusID				INT				FOREIGN KEY				REFERENCES OtobusBilgi_Tablosu(OtobusID),
Tarih					DATETIME2,
ToplamHasilat			DECIMAL(18,2)
)
GO
CREATE PROC RAPOR_BAS @OtobusID INT, @Tarih DATETIME2, @Hasilat DECIMAL(18,2)
AS
BEGIN
DECLARE @KisaTarih DATETIME2 = CAST (@Tarih AS DATE) ;
INSERT INTO GünlükRapor(OtobusID,Tarih,ToplamHasilat) VALUES (@OtobusID,@KisaTarih,@Hasilat)
END
GO
SELECT CAST( GETDATE() AS Date ) ;
GO

GO
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Adana')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Adýyaman')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Afyon')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Aðrý')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Amasya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ankara')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Antalya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Artvin')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Aydýn')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Balýkesir')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bilecik')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bingöl')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bitlis')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bolu')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Burdur')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bursa')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Çanakkale')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Çankýrý')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Çorum')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Denizli')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Diyarbakýr')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Edirne')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Elazýð')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Erzincan')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Erzurum')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Eskiþehir')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Gaziantep')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Giresun')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Gümüþhane')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Hakkari')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Hatay')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Isparta')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ýçel')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ýstanbul')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ýzmir')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kars')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kastamonu')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kayseri')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kýrklareli')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kýrþehir')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kocaeli')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Konya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kütahya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Malatya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Manisa')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kahramanmaraþ')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Mardin')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Muðla')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Muþ')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Nevþehir')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Niðde')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ordu')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Rize')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Sakarya')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Samsun')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Siirt')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Sinop')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Sivas')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Tekirdað')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Tokat')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Trabzon')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Tunceli')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Þanlýurfa')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Uþak')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Van')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Yozgat')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Zonguldak')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Aksaray')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bayburt')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Karaman')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kýrýkkale')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Batman')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Þýrnak')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Bartýn')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Ardahan')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Iðdýr')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Yalova')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Karabük')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Kilis')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Osmaniye')
INSERT INTO Sefer_Tablosu (Sehir) VALUES ('Düzce')
GO
INSERT INTO OtobusBilgi_Tablosu (OtobusModel,OtobusPlaka) VALUES ('Hiace','34 TME 54')
INSERT INTO OtobusBilgi_Tablosu (OtobusModel,OtobusPlaka) VALUES ('NV350','35 TRK 24')
INSERT INTO OtobusBilgi_Tablosu (OtobusModel,OtobusPlaka) VALUES ('Sprinter','06 TKU 66')
INSERT INTO OtobusBilgi_Tablosu (OtobusModel,OtobusPlaka) VALUES ('Transit','40 TAA 36')
GO
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (150)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (250)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (250)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (100)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (100)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (100)
INSERT INTO Koltuklar_Tablosu (FiyatBilgisi) VALUES (100)
GO
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (101,1,1)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (102,1,2)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (103,1,3)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (104,1,4)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (105,1,5)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (106,1,6)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (107,1,7)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (108,1,8)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (109,1,9)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (110,1,10)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (111,1,11)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (112,1,12)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (201,2,1)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (202,2,2)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (203,2,3)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (204,2,4)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (205,2,5)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (206,2,6)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (207,2,7)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (208,2,8)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (209,2,9)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (210,2,10)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (211,2,11)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (212,2,12)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (301,3,1)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (302,3,2)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (303,3,3)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (304,3,4)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (305,3,5)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (306,3,6)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (307,3,7)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (308,3,8)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (309,3,9)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (310,3,10)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (311,3,11)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (312,3,12)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (401,4,1)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (402,4,2)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (403,4,3)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (404,4,4)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (405,4,5)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (406,4,6)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (407,4,7)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (408,4,8)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (409,4,9)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (410,4,10)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (411,4,11)
INSERT INTO OtobusKoltukDuzeni_Tablosu(RezervID,OtobusID,KoltukID) VALUES (412,4,12)
GO
INSERT INTO Cinsiyet_Tablosu(Cinsiyet) VALUES ('Erkek')
INSERT INTO Cinsiyet_Tablosu(Cinsiyet) VALUES ('Kadýn')