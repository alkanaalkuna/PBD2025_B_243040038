--Buat Database TokoRetailDB--
CREATE DATABASE TokoRetailDB;

--Gunakan DB TokoRetailDB--
USE TokoRetailDB;

--Membuat Table KategoriProduk--
CREATE TABLE KategoriProduk (
KategoriID INT IDENTITY(1,1) PRIMARY KEY,
NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

--Membuat Table Produk--
CREATE TABLE Produk(
ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
SKU VARCHAR(20) NOT NULL UNIQUE,
NamaProduk VARCHAR(150) NOT NUlL,
Harga DECIMAL(10, 2) NOT NULL,
Stok  INT NOT NULL,
KategoriID INT NULL,

--harganya gaboleh negatif--
CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
--stoknya gaboleh negatif--
CONSTRAINT CHK_StokPositif CHECK (Stok>=0),
--relasikan dengan tabel KategoriProduk melalui KategoriID--
CONSTRAINT FK_Produk_Kategori
	FOREIGN KEY (KategoriID)
	REFERENCES KategoriProduk(KategoriID)
); 
--Memasukkan data ke tabel KategoriProduk--
INSERT INTO KategoriProduk (namaKategori)
VALUES
('Elektronik');

INSERT INTO KategoriProduk (namaKategori)
VALUES
('Pakaian'),
('Buku');

--Menampilkan tabel KategoriProduk--
SELECT * FROM KategoriProduk;

--Hanya Menampilkan NamaKategori--
SELECT NamaKategori FROM KategoriProduk;

--Menambahkan data ke tabel Produk--
INSERT INTO Produk (SKU,NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-001', 'Laptop gaming', 15000000.00, 50, 1); 

INSERT INTO Produk (SKU,NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-002', 'HP Gaming', 50000000.00, 50, 1);

--Menampilkan tabel Produk--
SELECT * FROM Produk;

--Mengubah data stok laptop gaming menjadi 30--
UPDATE Produk
SET Stok = 30
WHERE ProdukID = 1001;

--menghapus data HP Gaming--
BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1002;

--Cek apakah sudah terhapus atau belum--
SELECT * FROM Produk;

COMMIT TRANSACTION;

--menambah data lagi ke tabel produk--
INSERT INTO Produk (SKU,NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-001', 'Kaos Putih', 50000.00, 50, 2);

INSERT INTO Produk (SKU,NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-002', 'Kaos Putih', 50000.00, 30, 2);

SELECT * FROM Produk;

--menghapus kaos putih--
BEGIN TRAN;

 DELETE FROM Produk
 WHERE ProdukID = 1004;

 ROLLBACK TRANSACTION;

 COMMIT TRANSACTION;