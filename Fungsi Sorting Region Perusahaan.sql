-- Active: 1719251590957@@127.0.0.1@3306@fp_mbd
CREATE PROCEDURE FilterAlumnusByWorkCity(IN city VARCHAR(100))
BEGIN
    SELECT 
        a.NRP,
        a.Nama,
        a.Tanggal_Lahir,
        a.Alamat AS Alamat_Alumnus,
        a.Asal_Kota,
        a.No_HP,
        a.Email,
        a.Tahun_Masuk,
        a.Tahun_Lulus,
        a.Jenis_Kelamin,
        per.Nama_Perusahaan,
        per.Alamat AS Alamat_Perusahaan,
        per.Negara
    FROM 
        Alumnus a
        JOIN Pekerjaan j ON a.ID_Pekerjaan = j.Id_Pekerjaan
        JOIN Perusahaan per ON j.Id_Perusahaan = per.Id_Perusahaan
    WHERE 
        SUBSTRING_INDEX(SUBSTRING_INDEX(per.Alamat, ',', -1), ',', 1) LIKE CONCAT('%', city, '%');
END;

CALL FilterAlumnusByWorkCity('Jakarta');

