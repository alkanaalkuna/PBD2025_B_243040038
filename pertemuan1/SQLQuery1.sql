--buat database--
CREATE DATABASE UNPAS;

--menggunakan database--
USE UNPAS;

--buat tabel--
CREATE TABLE Mahasiswa (
npm CHAR(9),
nama VARCHAR(100),
jurusan VARCHAR(50)
)

--check structure--
EXEC sp_help 'Mahasiswa';

--add column--
ALTER TABLE Mahasiswa
ADD alamat VARCHAR(100) NOT NULL;

--change tipe data--
ALTER TABLE Mahasiswa
ALTER COLUMN nama VARCHAR(50);

--add constraint unique--
ALTER TABLE Mahasiswa
ADD CONSTRAINT UQ_npm_mahasiswa UNIQUE (npm);

--add dosen table--
CREATE TABLE Dosen (
nama VARCHAR(50),
nip CHAR(9),
alamat VARCHAR(100),
prodi VARCHAR(50)
)

--check--
EXEC sp_help 'Dosen';

--add pk in column--
ALTER TABLE Dosen
ADD CONSTRAINT PK_nip_dosen PRIMARY KEY (nip);

--delete contraint unique in column--
ALTER TABLE Mahasiswa
DROP CONSTRAINT UQ_npm_mahasiswa;

--add not null in column--
ALTER TABLE Mahasiswa
ALTER COLUMN npm CHAR(9) NOT NULL;

--add pk in npm column--
ALTER TABLE Mahasiswa
ADD CONSTRAINT PK_npm_mahasiswa PRIMARY KEY (npm);

--add nip--
ALTER TABLE Mahasiswa
ADD nip_pembimbing CHAR(9);

--add foreign key--
ALTER TABLE Mahasiswa
ADD CONSTRAINT FK_mahasiswa_dosen 
FOREIGN KEY (nip_pembimbing)
REFERENCES Dosen(nip);
