-- DDL 

-- Tabel Alumnus
CREATE TABLE Alumnus (
    NRP CHAR(15) PRIMARY KEY,
    Nama VARCHAR(100),
    Tanggal_Lahir DATE,
    Alamat VARCHAR(100),
    Asal_Kota VARCHAR(100),
    No_HP CHAR(15),
    Email VARCHAR(100),
    Tahun_Masuk INTEGER,
    Tahun_Lulus INTEGER,
    Jenis_Kelamin CHAR(1),
    ID_Pekerjaan CHAR(5)
);

-- Tabel Keahlian
CREATE TABLE Keahlian (
    Id_Keahlian CHAR(5) PRIMARY KEY,
    Nama_Keahlian VARCHAR(100)
);

-- Tabel Pekerjaan
CREATE TABLE Pekerjaan (
    Id_Pekerjaan CHAR(5) PRIMARY KEY,
    Nama_Pekerjaan VARCHAR(100),
    Id_Kategori_Pekerjaan CHAR(5),
    Id_Perusahaan CHAR(5),
    Id_Instansi_Pendidikan CHAR(5)
);

-- Tabel Kategori_Pekerjaan
CREATE TABLE Kategori_Pekerjaan (
    Id_Kategori CHAR(5) PRIMARY KEY,
    Nama_Kategori_Pekerjaan VARCHAR(100)
);

-- Tabel Perusahaan
CREATE TABLE Perusahaan (
    Id_Perusahaan CHAR(5) PRIMARY KEY,
    Nama_Perusahaan VARCHAR(100),
    Bidang_Industri VARCHAR(100),
    Alamat VARCHAR(100),
    Negara VARCHAR(100),
    Kontak VARCHAR(100),
    Pendapatan_Tahunan DECIMAL
);

-- Tabel Instansi_Pendidikan
CREATE TABLE Instansi_Pendidikan (
    Id_Instansi_Pendidikan CHAR(5) PRIMARY KEY,
    Nama_Instansi VARCHAR(100),
    Jenjang_Pendidikan VARCHAR(100)
);

-- Relasi antara entitas Instansi_Pendidikan dan Pekerjaan
ALTER TABLE Pekerjaan
ADD CONSTRAINT FK_Instansi_Pendidikan_Pekerjaan FOREIGN KEY (Id_Instansi_Pendidikan)
REFERENCES Instansi_Pendidikan(Id_Instansi_Pendidikan)
ON DELETE CASCADE;

-- Relasi antara entitas Alumnus dan Pekerjaan
ALTER TABLE Alumnus
ADD CONSTRAINT FK_Pekerjaan_Alumnus FOREIGN KEY (ID_Pekerjaan)
REFERENCES Pekerjaan(Id_Pekerjaan)
ON DELETE CASCADE;

-- Relasi antara entitas Perusahaan dan Pekerjaan
ALTER TABLE Pekerjaan
ADD CONSTRAINT FK_Perusahaan_Pekerjaan FOREIGN KEY (Id_Perusahaan)
REFERENCES Perusahaan(Id_Perusahaan)
ON DELETE CASCADE;

-- Relasi antara entitas Kategori_Pekerjaan dan Pekerjaan
ALTER TABLE Pekerjaan
ADD CONSTRAINT FK_Kategori_Pekerjaan_Pekerjaan FOREIGN KEY (Id_Kategori_Pekerjaan)
REFERENCES Kategori_Pekerjaan(Id_Kategori)
ON DELETE CASCADE;

-- Relasi antara entitas Alumnus dan Pekerjaan (Many-to-Many Relationship)
CREATE TABLE Alumnus_Pekerjaan (
    NRP CHAR(15),
    Id_Pekerjaan CHAR(5),
    PRIMARY KEY (NRP, Id_Pekerjaan),
    FOREIGN KEY (NRP) REFERENCES Alumnus(NRP) ON DELETE CASCADE,
    FOREIGN KEY (Id_Pekerjaan) REFERENCES Pekerjaan(Id_Pekerjaan) ON DELETE CASCADE
);

-- Relasi antara entitas Alumnus dan Keahlian (Many-to-Many Relationship)
CREATE TABLE Alumnus_Keahlian (
    NRP CHAR(15),
    Id_Keahlian CHAR(5),
    PRIMARY KEY (NRP, Id_Keahlian),
    FOREIGN KEY (NRP) REFERENCES Alumnus(NRP) ON DELETE CASCADE,
    FOREIGN KEY (Id_Keahlian) REFERENCES Keahlian(Id_Keahlian) ON DELETE CASCADE
);
