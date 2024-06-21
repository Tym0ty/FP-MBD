-- DDL 

-- Tabel Alumnus
CREATE TABLE Alumnus (
    NRP CHAR(15) PRIMARY KEY,
    Nama VARCHAR(100),
    Tanggal_Lahir DATE,
    Alamat VARCHAR(100),
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

-- DML

-- Tabel Alumnus
INSERT INTO Alumnus (NRP, Nama, Tanggal_Lahir, Alamat, No_HP, Email, Tahun_Masuk, Tahun_Lulus, Jenis_Kelamin, ID_Pekerjaan) VALUES
('123456789012345', 'Ahmad Rizky', '1990-02-15', 'Jl. Raya Jakarta No. 123', '081234567890', 'ahmad.rizky@example.com', 2008, 2012, 'L', 'PEK01'),
('234567890123456', 'Budi Santoso', '1992-05-20', 'Jl. Diponegoro No. 45', '081345678901', 'budi.santoso@example.com', 2010, 2014, 'L', 'PEK02'),
('345678901234567', 'Citra Dewi', '1991-10-10', 'Jl. Sudirman No. 78', '081456789012', 'citra.dewi@example.com', 2009, 2013, 'P', 'PEK03'),
('456789012345678', 'Dian Wulandari', '1993-03-25', 'Jl. Surya Sumantri No. 9', '081567890123', 'dian.wulandari@example.com', 2011, 2015, 'P', 'PEK04'),
('567890123456789', 'Eko Prabowo', '1989-12-12', 'Jl. Pahlawan No. 56', '081678901234', 'eko.prabowo@example.com', 2007, 2011, 'L', 'PEK05'),
('678901234567890', 'Fitri Indah', '1994-07-30', 'Jl. Gatot Subroto No. 23', '081789012345', 'fitri.indah@example.com', 2012, 2016, 'P', 'PEK06'),
('789012345678901', 'Galih Wijaya', '1990-09-18', 'Jl. Veteran No. 67', '081890123456', 'galih.wijaya@example.com', 2008, 2012, 'L', 'PEK07'),
('890123456789012', 'Hana Putri', '1992-04-05', 'Jl. Merdeka No. 34', '081901234567', 'hana.putri@example.com', 2010, 2014, 'P', 'PEK08'),
('901234567890123', 'Irfan Maulana', '1991-06-08', 'Jl. Asia Afrika No. 12', '081012345678', 'irfan.maulana@example.com', 2009, 2013, 'L', 'PEK09'),
('012345678901234', 'Joko Susilo', '1993-08-22', 'Jl. Hayam Wuruk No. 78', '081123456789', 'joko.susilo@example.com', 2011, 2015, 'L', 'PEK10'),
('123456789012356', 'Kartika Dewi', '1990-11-17', 'Jl. Raya Bandung No. 45', '081234567891', 'kartika.dewi@example.com', 2008, 2012, 'P', 'PEK11'),
('234567890123467', 'Lukman Hakim', '1992-02-28', 'Jl. Cendrawasih No. 78', '081345678912', 'lukman.hakim@example.com', 2010, 2014, 'L', 'PEK12'),
('345678901234699', 'Mega Astuti', '1991-05-14', 'Jl. Pahlawan Kusuma Bangsa No. 23', '081456789123', 'mega.astuti@example.com', 2009, 2013, 'P', 'PEK13'),
('456789012345755', 'Nanda Pratama', '1993-10-07', 'Jl. Dipati Ukur No. 34', '081567890234', 'nanda.pratama@example.com', 2011, 2015, 'L', 'PEK14'),
('567890123456811', 'Okta Novianti', '1989-01-25', 'Jl. Taman Sari No. 56', '081678901345', 'okta.novianti@example.com', 2007, 2011, 'P', 'PEK15'),
('678901234567345', 'Putra Wijaya', '1994-12-03', 'Jl. Veteran Barat No. 67', '081789012456', 'putra.wijaya@example.com', 2012, 2016, 'L', 'PEK16'),
('789012345621353', 'Rini Sulastri', '1990-03-19', 'Jl. Asia Afrika Barat No. 78', '081890123567', 'rini.sulastri@example.com', 2008, 2012, 'P', 'PEK17'),
('890123456746452', 'Satria Pratama', '1992-07-02', 'Jl. Sukarno Hatta No. 34', '081901234678', 'satria.pratama@example.com', 2010, 2014, 'L', 'PEK18'),
('901234567865345', 'Tika Kartika', '1991-09-09', 'Jl. Gatot Subroto Barat No. 12', '081012345789', 'tika.kartika@example.com', 2009, 2013, 'P', 'PEK19'),
('012345678964535', 'Umar Setiawan', '1993-04-28', 'Jl. Pahlawan Timur No. 78', '081123456890', 'umar.setiawan@example.com', 2011, 2015, 'L', 'PEK20'),
('123456765245324', 'Vina Septiani', '1990-06-11', 'Jl. Asia Afrika Timur No. 45', '081234567901', 'vina.septiani@example.com', 2008, 2012, 'P', 'PEK21'),
('234567890451454', 'Wawan Hermawan', '1992-09-26', 'Jl. Diponegoro Barat No. 78', '081345678912', 'wawan.hermawan@example.com', 2010, 2014, 'L', 'PEK22'),
('345678901265255', 'Xena Putri', '1991-11-13', 'Jl. Sudirman Timur No. 23', '081456789123', 'xena.putri@example.com', 2009, 2013, 'P', 'PEK23'),
('456789012785679', 'Yoga Prasetyo', '1993-02-07', 'Jl. Merdeka Barat No. 34', '081567890234', 'yoga.prasetyo@example.com', 2011, 2015, 'L', 'PEK24'),
('567890123456470', 'Zahra Azzahra', '1989-05-15', 'Jl. Pahlawan Kusuma Bangsa Barat No. 56', '081678901345', 'zahra.azzahra@example.com', 2007, 2011, 'P', 'PEK25'),
('678904784787901', 'Andi Setiawan', '1994-08-03', 'Jl. Veteran Barat No. 67', '081789012456', 'andi.setiawan@example.com', 2012, 2016, 'L', 'PEK26'),
('789046745678012', 'Bunga Citra', '1990-01-19', 'Jl. Asia Afrika Barat No. 78', '081890123567', 'bunga.citra@example.com', 2008, 2012, 'P', 'PEK27'),
('890123456789143', 'Cahyo Purnomo', '1992-04-02', 'Jl. Sukarno Hatta Barat No. 34', '081901234678', 'cahyo.purnomo@example.com', 2010, 2014, 'L', 'PEK28'),
('901234567865254', 'Dewi Lestari', '1991-06-09', 'Jl. Gatot Subroto Barat No. 12', '081012345789', 'dewi.lestari@example.com', 2009, 2013, 'P', 'PEK29'),
('012345678145134', 'Eko Prasetio', '1993-10-28', 'Jl. Pahlawan Timur No. 78', '081123456890', 'eko.prasetio@example.com', 2011, 2015, 'L', 'PEK30'),
('123456789046443', 'Fina Wijaya', '1990-12-11', 'Jl. Asia Afrika Timur No. 45', '081234567901', 'fina.wijaya@example.com', 2008, 2012, 'P', 'PEK31'),
('234567865545154', 'Gita Permata', '1992-01-26', 'Jl. Diponegoro Barat No. 78', '081345678912', 'gita.permata@example.com', 2010, 2014, 'L', 'PEK32'),
('345678901232131', 'Hadi Santoso', '1991-03-13', 'Jl. Sudirman Timur No. 23', '081456789123', 'hadi.santoso@example.com', 2009, 2013, 'L', 'PEK33'),
('456789015465214', 'Indah Sari', '1993-06-07', 'Jl. Merdeka Barat No. 34', '081567890234', 'indah.sari@example.com', 2011, 2015, 'P', 'PEK34'),
('567890126524543', 'Joko Susanto', '1989-09-15', 'Jl. Pahlawan Kusuma Bangsa Barat No. 56', '081678901345', 'joko.susanto@example.com', 2007, 2011, 'L', 'PEK35'),
('678907635624154', 'Kartika Sari', '1994-11-03', 'Jl. Veteran Barat No. 67', '081789012456', 'kartika.sari@example.com', 2012, 2016, 'P', 'PEK36'),
('789012652456242', 'Lukman Hakim', '1990-02-19', 'Jl. Asia Afrika Barat No. 78', '081890123567', 'lukman.hakim@example.com', 2008, 2012, 'L', 'PEK37'),
('890125652452342', 'Mega Wati', '1992-05-02', 'Jl. Sukarno Hatta Barat No. 34', '081901234678', 'mega.wati@example.com', 2010, 2014, 'P', 'PEK38'),
('901234565625454', 'Nurul Fitri', '1991-07-09', 'Jl. Gatot Subroto Barat No. 12', '081012345789', 'nurul.fitri@example.com', 2009, 2013, 'P', 'PEK39'),
('012345612312435', 'Okta Prasetio', '1993-11-28', 'Jl. Pahlawan Timur No. 78', '081123456890', 'okta.prasetio@example.com', 2011, 2015, 'L', 'PEK40'),
('123456788394783', 'Putri Wijaya', '1990-01-11', 'Jl. Asia Afrika Timur No. 45', '081234567901', 'putri.wijaya@example.com', 2008, 2012, 'P', 'PEK41'),
('234567845145145', 'Rudi Setiawan', '1992-02-26', 'Jl. Diponegoro Barat No. 78', '081345678912', 'rudi.setiawan@example.com', 2010, 2014, 'L', 'PEK42'),
('345678906525254', 'Santi Indah', '1991-04-13', 'Jl. Sudirman Timur No. 23', '081456789123', 'santi.indah@example.com', 2009, 2013, 'P', 'PEK43'),
('456789245234623', 'Tono Santoso', '1993-07-07', 'Jl. Merdeka Barat No. 34', '081567890234', 'tono.santoso@example.com', 2011, 2015, 'L', 'PEK44'),
('567890124314514', 'Uci Permata', '1989-10-15', 'Jl. Pahlawan Kusuma Bangsa Barat No. 56', '081678901345', 'uci.permata@example.com', 2007, 2011, 'P', 'PEK45'),
('678901234652454', 'Vina Susanti', '1994-12-03', 'Jl. Veteran Barat No. 67', '081789012456', 'vina.susanti@example.com', 2012, 2016, 'P', 'PEK46'),
('789012342452454', 'Wawan Hermawan', '1990-01-19', 'Jl. Asia Afrika Barat No. 78', '081890123567', 'wawan.hermawan@example.com', 2008, 2012, 'L', 'PEK47'),
('890123456453455', 'Xena Wijaya', '1992-04-02', 'Jl. Sukarno Hatta Barat No. 34', '081901234678', 'xena.wijaya@example.com', 2010, 2014, 'P', 'PEK48'),
('901234565625866', 'Yanti Lestari', '1991-06-09', 'Jl. Gatot Subroto Barat No. 12', '081012345789', 'yanti.lestari@example.com', 2009, 2013, 'P', 'PEK49'),
('012345678987856', 'Zainal Prasetio', '1993-10-28', 'Jl. Pahlawan Timur No. 78', '081123456890', 'zainal.prasetio@example.com', 2011, 2015, 'L', 'PEK50');

-- Tabel Keahlian
INSERT INTO Keahlian (Id_Keahlian, Nama_Keahlian) VALUES
('KHL01', 'Pengembangan Aplikasi Mobile'),
('KHL02', 'Desain Grafis'),
('KHL03', 'Pemrograman Web'),
('KHL04', 'Analisis Data'),
('KHL05', 'Manajemen Proyek'),
('KHL06', 'Jaringan Komputer'),
('KHL07', 'Keamanan Informasi'),
('KHL08', 'Pengembangan Perangkat Lunak'),
('KHL09', 'Sistem Basis Data'),
('KHL10', 'Keahlian Jaringan'),
('KHL11', 'Manajemen Sistem Informasi'),
('KHL12', 'Desain Interaksi Pengguna'),
('KHL13', 'Kecerdasan Buatan'),
('KHL14', 'Teknologi Cloud'),
('KHL15', 'Analisis Keamanan'),
('KHL16', 'Pengujian Perangkat Lunak'),
('KHL17', 'Pengembangan Front-End'),
('KHL18', 'Pengembangan Back-End'),
('KHL19', 'Rekayasa Perangkat Lunak'),
('KHL20', 'Analisis Bisnis'),
('KHL21', 'Manajemen Produk'),
('KHL22', 'Manajemen Kualitas Perangkat Lunak'),
('KHL23', 'Desain User Experience'),
('KHL24', 'Manajemen Database'),
('KHL25', 'Sistem Operasi'),
('KHL26', 'Pemrograman Berbasis Objek'),
('KHL27', 'Pemrograman Fungsional'),
('KHL28', 'Pengembangan Game'),
('KHL29', 'Pemodelan Matematika'),
('KHL30', 'Pengolahan Citra'),
('KHL31', 'Pengolahan Bahasa Alami'),
('KHL32', 'Pemodelan Simulasi'),
('KHL33', 'Pemrosesan Paralel'),
('KHL34', 'Pemrosesan Big Data'),
('KHL35', 'Rekayasa Sistem'),
('KHL36', 'Manajemen Layanan TI'),
('KHL37', 'Manajemen Konfigurasi'),
('KHL38', 'Desain Arsitektur TI'),
('KHL39', 'Manajemen Kapasitas'),
('KHL40', 'Manajemen Perubahan'),
('KHL41', 'Manajemen Keamanan'),
('KHL42', 'Manajemen Integrasi'),
('KHL43', 'Manajemen Aset TI'),
('KHL44', 'Manajemen Pengetahuan'),
('KHL45', 'Manajemen Layanan Bisnis'),
('KHL46', 'Manajemen Keberlanjutan'),
('KHL47', 'Manajemen Kualitas'),
('KHL48', 'Manajemen Resiko'),
('KHL49', 'Manajemen Proses'),
('KHL50', 'Manajemen Portofolio');

-- Tabel Kategori_Pekerjaan
INSERT INTO Kategori_Pekerjaan (Id_Kategori, Nama_Kategori_Pekerjaan) VALUES
('KTG01', 'Teknologi Informasi dan Komunikasi (TIK)'),
('KTG02', 'Manajemen Proyek'),
('KTG03', 'Manajemen Produk dan Layanan'),
('KTG04', 'Analisis dan Pengembangan Bisnis'),
('KTG05', 'Teknis dan Dukungan TI'),
('KTG06', 'Manajemen dan Kepemimpinan TI'),
('KTG07', 'Jaringan dan Infrastruktur TI'),
('KTG08', 'Desain dan Pengembangan Perangkat Lunak'),
('KTG09', 'Keamanan Informasi'),
('KTG10', 'Pengembangan Web dan Aplikasi'),
('KTG11', 'Pengembangan Permainan dan Animasi'),
('KTG12', 'Data Science dan Analisis'),
('KTG13', 'Cloud Computing dan Arsitektur TI'),
('KTG14', 'Manajemen Layanan TI dan Proses'),
('KTG15', 'Manajemen Risiko dan Kepatuhan TI'),
('KTG16', 'Manajemen Strategis dan Transformasi TI'),
('KTG17', 'Manajemen Aset dan Kapasitas TI'),
('KTG18', 'Manajemen Kualitas dan Pengujian TI'),
('KTG19', 'Manajemen Operasi dan Pemeliharaan TI'),
('KTG20', 'Manajemen Keamanan dan Keberlanjutan TI'),
('KTG21', 'Manajemen Layanan Bisnis TI'),
('KTG22', 'Manajemen Pengetahuan dan Intelektual'),
('KTG23', 'Manajemen Sumber Daya Manusia TI'),
('KTG24', 'Manajemen Keuangan dan Akuntansi TI'),
('KTG25', 'Manajemen Pelanggan dan CRM TI'),
('KTG26', 'Manajemen Proses Bisnis dan BPM TI'),
('KTG27', 'Manajemen Proyek dan Portofolio TI'),
('KTG28', 'Manajemen Kualitas dan Audit TI'),
('KTG29', 'Manajemen Komunikasi dan Interaksi TI'),
('KTG30', 'Manajemen Inovasi dan Kreativitas TI'),
('KTG31', 'Manajemen Integrasi dan Kolaborasi TI'),
('KTG32', 'Manajemen Riset dan Pengembangan TI'),
('KTG33', 'Manajemen Perubahan dan Transformasi TI'),
('KTG34', 'Manajemen Lingkungan dan Keberlanjutan TI'),
('KTG35', 'Manajemen Logistik dan Distribusi TI'),
('KTG36', 'Manajemen Penjualan dan Pemasaran TI'),
('KTG37', 'Manajemen Layanan Pelanggan TI'),
('KTG38', 'Manajemen Produksi dan Manufaktur TI'),
('KTG39', 'Manajemen Pengadaan dan Suplai TI'),
('KTG40', 'Manajemen Inventaris dan Gudang TI'),
('KTG41', 'Manajemen Rantai Pasok dan SCM TI'),
('KTG42', 'Manajemen Transportasi dan Distribusi TI'),
('KTG43', 'Manajemen Keamanan dan Keselamatan Kerja TI'),
('KTG44', 'Manajemen Energi dan Sumber Daya TI'),
('KTG45', 'Manajemen Lingkungan dan Keberlanjutan TI'),
('KTG46', 'Manajemen Kualitas dan Audit TI'),
('KTG47', 'Manajemen Layanan dan Pelayanan TI'),
('KTG48', 'Manajemen Keuangan dan Investasi TI'),
('KTG49', 'Manajemen Risiko dan Asuransi TI'),
('KTG50', 'Manajemen Penjualan dan Pemasaran TI');

-- Tabel Instansi_Pendidikan
INSERT INTO Instansi_Pendidikan (Id_Instansi_Pendidikan, Nama_Instansi, Jenjang_Pendidikan) VALUES
('INS01', 'Universitas Indonesia', 'Perguruan Tinggi'),
('INS02', 'Institut Teknologi Bandung', 'Perguruan Tinggi'),
('INS03', 'Universitas Gadjah Mada', 'Perguruan Tinggi'),
('INS04', 'Universitas Airlangga', 'Perguruan Tinggi'),
('INS05', 'Universitas Diponegoro', 'Perguruan Tinggi'),
('INS06', 'Institut Pertanian Bogor', 'Perguruan Tinggi'),
('INS07', 'Universitas Padjadjaran', 'Perguruan Tinggi'),
('INS08', 'Universitas Brawijaya', 'Perguruan Tinggi'),
('INS09', 'Universitas Sebelas Maret', 'Perguruan Tinggi'),
('INS10', 'Institut Teknologi Sepuluh Nopember', 'Perguruan Tinggi'),
('INS11', 'Universitas Hasanuddin', 'Perguruan Tinggi'),
('INS12', 'Universitas Jenderal Soedirman', 'Perguruan Tinggi'),
('INS13', 'Universitas Sumatera Utara', 'Perguruan Tinggi'),
('INS14', 'Universitas Lampung', 'Perguruan Tinggi'),
('INS15', 'Universitas Kristen Petra', 'Perguruan Tinggi'),
('INS16', 'Universitas Kristen Satya Wacana', 'Perguruan Tinggi'),
('INS17', 'Universitas Katolik Parahyangan', 'Perguruan Tinggi'),
('INS18', 'Institut Seni Indonesia Yogyakarta', 'Perguruan Tinggi'),
('INS19', 'Institut Teknologi Telkom', 'Perguruan Tinggi'),
('INS20', 'Universitas Muhammadiyah Surakarta', 'Perguruan Tinggi'),
('INS21', 'Universitas Sanata Dharma', 'Perguruan Tinggi'),
('INS22', 'Universitas Tarumanagara', 'Perguruan Tinggi'),
('INS23', 'Universitas Trisakti', 'Perguruan Tinggi'),
('INS24', 'Universitas Negeri Jakarta', 'Perguruan Tinggi'),
('INS25', 'Universitas Negeri Yogyakarta', 'Perguruan Tinggi'),
('INS26', 'Universitas Negeri Semarang', 'Perguruan Tinggi'),
('INS27', 'Universitas Negeri Malang', 'Perguruan Tinggi'),
('INS28', 'Universitas Negeri Surabaya', 'Perguruan Tinggi'),
('INS29', 'Universitas Negeri Padang', 'Perguruan Tinggi'),
('INS30', 'Universitas Negeri Medan', 'Perguruan Tinggi'),
('INS31', 'Universitas Negeri Makassar', 'Perguruan Tinggi'),
('INS32', 'Universitas Negeri Gorontalo', 'Perguruan Tinggi'),
('INS33', 'Universitas Negeri Manado', 'Perguruan Tinggi'),
('INS34', 'Universitas Negeri Ambon', 'Perguruan Tinggi'),
('INS35', 'Universitas Negeri Papua', 'Perguruan Tinggi'),
('INS36', 'Universitas Terbuka', 'Perguruan Tinggi'),
('INS37', 'Sekolah Tinggi Ilmu Ekonomi Indonesia', 'Perguruan Tinggi'),
('INS38', 'Sekolah Tinggi Teknologi Telkom', 'Perguruan Tinggi'),
('INS39', 'Sekolah Tinggi Manajemen Informatika dan Komputer', 'Perguruan Tinggi'),
('INS40', 'Sekolah Tinggi Teknologi Garut', 'Perguruan Tinggi'),
('INS41', 'Sekolah Tinggi Teknologi Bandung', 'Perguruan Tinggi'),
('INS42', 'Sekolah Tinggi Teknologi Jakarta', 'Perguruan Tinggi'),
('INS43', 'Sekolah Tinggi Teknologi Semarang', 'Perguruan Tinggi'),
('INS44', 'Sekolah Tinggi Teknologi Surabaya', 'Perguruan Tinggi'),
('INS45', 'Sekolah Tinggi Teknologi Padang', 'Perguruan Tinggi'),
('INS46', 'Sekolah Tinggi Teknologi Palembang', 'Perguruan Tinggi'),
('INS47', 'Sekolah Tinggi Teknologi Pontianak', 'Perguruan Tinggi'),
('INS48', 'Sekolah Tinggi Teknologi Samarinda', 'Perguruan Tinggi'),
('INS49', 'Sekolah Tinggi Teknologi Banjarmasin', 'Perguruan Tinggi'),
('INS50', 'Sekolah Tinggi Teknologi Makassar', 'Perguruan Tinggi');

-- Tabel Perusahaan
INSERT INTO Perusahaan (Id_Perusahaan, Nama_Perusahaan, Bidang_Industri, Alamat, Negara, Kontak, Pendapatan_Tahunan) VALUES
('PRS01', 'PT Teknologi Maju', 'Teknologi Informasi', 'Jl. Sudirman No. 123, Jakarta', 'Indonesia', '021-1234567', 1000000000),
('PRS02', 'PT Sejahtera Jaya', 'Perdagangan', 'Jl. Thamrin No. 456, Jakarta', 'Indonesia', '021-2345678', 800000000),
('PRS03', 'PT Bersama Mandiri', 'Keuangan', 'Jl. Gatot Subroto No. 789, Jakarta', 'Indonesia', '021-3456789', 1200000000),
('PRS04', 'PT Sentosa Abadi', 'Manufaktur', 'Jl. Asia Afrika No. 101, Bandung', 'Indonesia', '022-1234567', 1500000000),
('PRS05', 'PT Berkah Makmur', 'Pendidikan', 'Jl. Diponegoro No. 202, Surabaya', 'Indonesia', '031-1234567', 500000000),
('PRS06', 'PT Gemilang Sukses', 'Kesehatan', 'Jl. Surya Sumantri No. 303, Bandung', 'Indonesia', '022-2345678', 900000000),
('PRS07', 'PT Prima Sentosa', 'Perhotelan', 'Jl. Imam Bonjol No. 404, Yogyakarta', 'Indonesia', '0271-1234567', 700000000),
('PRS08', 'PT Mega Jaya', 'Properti', 'Jl. Pahlawan No. 505, Surabaya', 'Indonesia', '031-2345678', 1100000000),
('PRS09', 'PT Harmoni Sejahtera', 'Transportasi', 'Jl. Veteran No. 606, Jakarta', 'Indonesia', '021-4567890', 1300000000),
('PRS10', 'PT Cemerlang Makmur', 'Energi', 'Jl. Gatot Subroto No. 707, Jakarta', 'Indonesia', '021-5678901', 1800000000),
('PRS11', 'PT Lancar Makmur', 'Telekomunikasi', 'Jl. Thamrin No. 808, Jakarta', 'Indonesia', '021-6789012', 2000000000),
('PRS12', 'PT Sinar Sentosa', 'Konstruksi', 'Jl. Sudirman No. 909, Surabaya', 'Indonesia', '031-3456789', 1600000000),
('PRS13', 'PT Indah Maju Jaya', 'Agribisnis', 'Jl. Diponegoro No. 1010, Bandung', 'Indonesia', '022-3456789', 1400000000),
('PRS14', 'PT Cahaya Harmoni', 'Hiburan', 'Jl. Asia Afrika No. 1111, Jakarta', 'Indonesia', '021-7890123', 900000000),
('PRS15', 'PT Maju Bersama', 'Pariwisata', 'Jl. Sudirman No. 1212, Surabaya', 'Indonesia', '031-4567890', 1200000000),
('PRS16', 'PT Terang Sukses', 'Retail', 'Jl. Thamrin No. 1313, Jakarta', 'Indonesia', '021-8901234', 1000000000),
('PRS17', 'PT Makmur Sentosa', 'Biro Perjalanan', 'Jl. Gatot Subroto No. 1414, Jakarta', 'Indonesia', '021-9012345', 800000000),
('PRS18', 'PT Bahagia Bersama', 'Otomotif', 'Jl. Asia Afrika No. 1515, Bandung', 'Indonesia', '022-4567890', 1500000000),
('PRS19', 'PT Cipta Jaya', 'Konsultan', 'Jl. Diponegoro No. 1616, Jakarta', 'Indonesia', '021-0123456', 700000000),
('PRS20', 'PT Jaya Makmur Sejahtera', 'Produksi Film', 'Jl. Thamrin No. 1717, Surabaya', 'Indonesia', '031-5678901', 1100000000),
('PRS21', 'PT Mandiri Sukses', 'Penerbitan', 'Jl. Sudirman No. 1818, Jakarta', 'Indonesia', '021-1234567', 1300000000),
('PRS22', 'PT Megah Jaya', 'Event Organizer', 'Jl. Gatot Subroto No. 1919, Bandung', 'Indonesia', '022-2345678', 1600000000),
('PRS23', 'PT Sejahtera Sentosa', 'Penyiaran', 'Jl. Asia Afrika No. 2020, Jakarta', 'Indonesia', '021-3456789', 1800000000),
('PRS24', 'PT Sukses Bersama', 'Rekreasi', 'Jl. Diponegoro No. 2121, Surabaya', 'Indonesia', '031-4567890', 2000000000),
('PRS25', 'PT Purnama Jaya', 'Pengangkutan', 'Jl. Thamrin No. 2222, Jakarta', 'Indonesia', '021-5678901', 900000000),
('PRS26', 'PT Harmoni Makmur', 'Layanan Kesehatan', 'Jl. Sudirman No. 2323, Bandung', 'Indonesia', '022-6789012', 1400000000),
('PRS27', 'PT Makmur Sentosa Abadi', 'Perbankan', 'Jl. Gatot Subroto No. 2424, Jakarta', 'Indonesia', '021-7890123', 1600000000),
('PRS28', 'PT Maju Lancar Jaya', 'Reksa Dana', 'Jl. Asia Afrika No. 2525, Bandung', 'Indonesia', '022-8901234', 1200000000),
('PRS29', 'PT Bersama Jaya Makmur', 'Bursa Efek', 'Jl. Diponegoro No. 2626, Jakarta', 'Indonesia', '021-9012345', 800000000),
('PRS30', 'PT Sejahtera Bersama Sentosa', 'Pengelolaan Aset', 'Jl. Thamrin No. 2727, Surabaya', 'Indonesia', '031-0123456', 1000000000),
('PRS31', 'PT Makmur Sejahtera Bersama', 'Investasi', 'Jl. Sudirman No. 2828, Jakarta', 'Indonesia', '021-1234567', 1300000000),
('PRS32', 'PT Lancar Makmur Sentosa', 'Pertambangan', 'Jl. Gatot Subroto No. 2929, Bandung', 'Indonesia', '022-2345678', 1500000000),
('PRS33', 'PT Sukses Sejahtera Bersama', 'Bioteknologi', 'Jl. Asia Afrika No. 3030, Jakarta', 'Indonesia', '021-3456789', 1700000000),
('PRS34', 'PT Bersama Maju Sejahtera', 'Farmasi', 'Jl. Diponegoro No. 3131, Surabaya', 'Indonesia', '031-4567890', 1100000000),
('PRS35', 'PT Cipta Lancar Jaya', 'Pangan', 'Jl. Thamrin No. 3232, Jakarta', 'Indonesia', '021-5678901', 1400000000),
('PRS36', 'PT Jaya Makmur Bersama', 'Pertanian', 'Jl. Sudirman No. 3333, Bandung', 'Indonesia', '022-6789012', 1600000000),
('PRS37', 'PT Sentosa Sejahtera Bersama', 'Perdagangan Elektronik', 'Jl. Gatot Subroto No. 3434, Jakarta', 'Indonesia', '021-7890123', 1800000000),
('PRS38', 'PT Harmoni Bersama Jaya', 'Teknologi Pendidikan', 'Jl. Asia Afrika No. 3535, Bandung', 'Indonesia', '022-8901234', 1200000000),
('PRS39', 'PT Bersama Makmur Lancar', 'Perangkat Lunak', 'Jl. Diponegoro No. 3636, Surabaya', 'Indonesia', '031-9012345', 1000000000),
('PRS40', 'PT Sentosa Sejahtera Makmur', 'Hardware Komputer', 'Jl. Thamrin No. 3737, Jakarta', 'Indonesia', '021-0123456', 1500000000),
('PRS41', 'PT Makmur Jaya Bersama', 'Telekomunikasi', 'Jl. Sudirman No. 3838, Bandung', 'Indonesia', '022-1234567', 1300000000),
('PRS42', 'PT Lancar Sentosa Makmur', 'Aplikasi Mobile', 'Jl. Gatot Subroto No. 3939, Jakarta', 'Indonesia', '021-2345678', 1700000000),
('PRS43', 'PT Maju Bersama Lancar', 'Web Hosting', 'Jl. Asia Afrika No. 4040, Bandung', 'Indonesia', '022-3456789', 1900000000),
('PRS44', 'PT Sentosa Jaya Makmur', 'E-commerce', 'Jl. Diponegoro No. 4141, Surabaya', 'Indonesia', '031-4567890', 2000000000),
('PRS45', 'PT Makmur Bersama Jaya', 'Fintech', 'Jl. Thamrin No. 4242, Jakarta', 'Indonesia', '021-5678901', 1100000000),
('PRS46', 'PT Bersama Sentosa Jaya', 'Kesehatan Digital', 'Jl. Sudirman No. 4343, Bandung', 'Indonesia', '022-6789012', 1300000000),
('PRS47', 'PT Jaya Lancar Makmur', 'Manajemen Risiko', 'Jl. Gatot Subroto No. 4444, Jakarta', 'Indonesia', '021-7890123', 1500000000),
('PRS48', 'PT Sentosa Makmur Bersama', 'Konsultan Bisnis', 'Jl. Asia Afrika No. 4545, Bandung', 'Indonesia', '022-8901234', 1700000000),
('PRS49', 'PT Makmur Bersama Sentosa', 'Kesehatan Mental', 'Jl. Diponegoro No. 4646, Surabaya', 'Indonesia', '031-9012345', 1900000000),
('PRS50', 'PT Bersama Jaya Lancar', 'Pembelajaran Online', 'Jl. Thamrin No. 4747, Jakarta', 'Indonesia', '021-0123456', 2000000000);

INSERT INTO Pekerjaan (Id_Pekerjaan, Nama_Pekerjaan, Id_Kategori_Pekerjaan, Id_Perusahaan, Id_Instansi_Pendidikan) VALUES
('PEK01', 'Programmer', 'KTG01', 'PRS01', 'INS01'),
('PEK02', 'Desainer Grafis', 'KTG01', 'PRS02', 'INS02'),
('PEK03', 'System Analyst', 'KTG01', 'PRS03', 'INS03'),
('PEK04', 'Project Manager', 'KTG02', 'PRS04', 'INS04'),
('PEK05', 'Network Engineer', 'KTG02', 'PRS05', 'INS05'),
('PEK06', 'Database Administrator', 'KTG02', 'PRS06', 'INS06'),
('PEK07', 'Security Specialist', 'KTG03', 'PRS07', 'INS07'),
('PEK08', 'Software Developer', 'KTG08', 'PRS08', 'INS08'),
('PEK09', 'Web Developer', 'KTG10', 'PRS09', 'INS09'),
('PEK10', 'UI/UX Designer', 'KTG08', 'PRS10', 'INS10'),
('PEK11', 'Data Scientist', 'KTG12', 'PRS11', 'INS11'),
('PEK12', 'Cloud Engineer', 'KTG13', 'PRS12', 'INS12'),
('PEK13', 'IT Consultant', 'KTG04', 'PRS13', 'INS13'),
('PEK14', 'Technical Support', 'KTG05', 'PRS14', 'INS14'),
('PEK15', 'Quality Assurance', 'KTG05', 'PRS15', 'INS15'),
('PEK16', 'Business Analyst', 'KTG04', 'PRS16', 'INS16'),
('PEK17', 'Product Manager', 'KTG04', 'PRS17', 'INS17'),
('PEK18', 'Scrum Master', 'KTG04', 'PRS18', 'INS18'),
('PEK19', 'IT Manager', 'KTG06', 'PRS19', 'INS19'),
('PEK20', 'CTO (Chief Technology Officer)', 'KTG06', 'PRS20', 'INS20'),
('PEK21', 'CIO (Chief Information Officer)', 'KTG06', 'PRS21', 'INS21'),
('PEK22', 'Network Administrator', 'KTG07', 'PRS22', 'INS22'),
('PEK23', 'System Administrator', 'KTG07', 'PRS23', 'INS23'),
('PEK24', 'IT Trainer', 'KTG07', 'PRS24', 'INS24'),
('PEK25', 'IT Auditor', 'KTG09', 'PRS25', 'INS25'),
('PEK26', 'Penetration Tester', 'KTG09', 'PRS26', 'INS26'),
('PEK27', 'Ethical Hacker', 'KTG09', 'PRS27', 'INS27'),
('PEK28', 'Front-end Developer', 'KTG10', 'PRS28', 'INS28'),
('PEK29', 'Back-end Developer', 'KTG10', 'PRS29', 'INS29'),
('PEK30', 'Full-stack Developer', 'KTG10', 'PRS30', 'INS30'),
('PEK31', 'Game Developer', 'KTG11', 'PRS31', 'INS31'),
('PEK32', 'Mobile App Developer', 'KTG11', 'PRS32', 'INS32'),
('PEK33', 'Embedded Systems Engineer', 'KTG11', 'PRS33', 'INS33'),
('PEK34', 'Data Engineer', 'KTG12', 'PRS34', 'INS34'),
('PEK35', 'Machine Learning Engineer', 'KTG12', 'PRS35', 'INS35'),
('PEK36', 'DevOps Engineer', 'KTG12', 'PRS36', 'INS36'),
('PEK37', 'IT Architect', 'KTG13', 'PRS37', 'INS37'),
('PEK38', 'IT Project Manager', 'KTG13', 'PRS38', 'INS38'),
('PEK39', 'IT Risk Manager', 'KTG13', 'PRS39', 'INS39'),
('PEK40', 'IT Procurement Manager', 'KTG14', 'PRS40', 'INS40'),
('PEK41', 'IT Service Manager', 'KTG14', 'PRS41', 'INS41'),
('PEK42', 'IT Operations Manager', 'KTG14', 'PRS42', 'INS42'),
('PEK43', 'IT Security Manager', 'KTG15', 'PRS43', 'INS43'),
('PEK44', 'IT Governance Manager', 'KTG15', 'PRS44', 'INS44'),
('PEK45', 'IT Compliance Manager', 'KTG15', 'PRS45', 'INS45'),
('PEK46', 'IT Portfolio Manager', 'KTG16', 'PRS46', 'INS46'),
('PEK47', 'IT Change Manager', 'KTG16', 'PRS47', 'INS47'),
('PEK48', 'IT Capacity Manager', 'KTG16', 'PRS48', 'INS48'),
('PEK49', 'IT Asset Manager', 'KTG17', 'PRS49', 'INS49'),
('PEK50', 'IT Knowledge Manager', 'KTG17', 'PRS50', 'INS50');