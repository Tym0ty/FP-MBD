CREATE PROCEDURE Sort_Alumni_By_Year_With_Duration(IN year INT)
BEGIN
    SELECT 
        NRP,
        Nama,
        Tanggal_Lahir,
        Alamat,
        No_HP,
        Email,
        Tahun_Masuk,
        Tahun_Lulus,
        Jenis_Kelamin,
        ID_Pekerjaan,
        (Tahun_Lulus - Tahun_Masuk) AS Lama_Lulus
    FROM 
        Alumnus 
    WHERE 
        Tahun_Lulus = year 
    ORDER BY 
        Nama;
END;

CALL Sort_Alumni_By_Year_With_Duration(2012);
