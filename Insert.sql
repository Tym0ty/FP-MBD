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
