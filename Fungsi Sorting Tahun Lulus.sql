DELIMITER //
CREATE FUNCTION Sort_Alumni_By_Year_With_Duration(
year INT
) RETURNS TABLE (
    NRP VARCHAR(15),
    Nama VARCHAR(255),
    Tanggal_Lahir DATE,
    Alamat VARCHAR(255),
    No_HP VARCHAR(15),
    Email VARCHAR(255),
    Tahun_Masuk INT,
    Tahun_Lulus INT,
    Jenis_Kelamin CHAR(1),
    ID_Pekerjaan VARCHAR(5),
    Lama_Lulus INT
)
BEGIN
    RETURN QUERY
    SELECT *, Tahun_Masuk - Tahun_Lulus AS Lama_Lulus 
    FROM Alumnus WHERE Tahun_Lulus = year ORDER BY Nama;
END//
DELIMITER ;

SELECT * FROM Sort_Alumni_By_Year_With_Duration(2012);
