CREATE PROCEDURE InsertAndUpdateAlumnus(
    IN p_NRP CHAR(15),
    IN p_Nama VARCHAR(100),
    IN p_Tanggal_Lahir DATE,
    IN p_Alamat VARCHAR(100),
    IN p_Asal_Kota VARCHAR(100),
    IN p_No_HP CHAR(15),
    IN p_Email VARCHAR(100),
    IN p_Tahun_Masuk INTEGER,
    IN p_Tahun_Lulus INTEGER,
    IN p_Jenis_Kelamin CHAR(1),
    IN p_ID_Pekerjaan CHAR(5),
    IN p_Usia INTEGER
)
BEGIN
    -- Insert the data into Alumnus table
    INSERT INTO Alumnus (
        NRP,
        Nama,
        Tanggal_Lahir,
        Alamat,
        Asal_Kota,
        No_HP,
        Email,
        Tahun_Masuk,
        Tahun_Lulus,
        Jenis_Kelamin,
        ID_Pekerjaan,
        Usia
    ) VALUES (
        p_NRP,
        p_Nama,
        p_Tanggal_Lahir,
        p_Alamat,
        p_Asal_Kota,
        p_No_HP,
        p_Email,
        p_Tahun_Masuk,
        p_Tahun_Lulus,
        p_Jenis_Kelamin,
        p_ID_Pekerjaan,
        p_Usia
    );

    -- Update Usia for the newly inserted row
    UPDATE Alumnus
    SET Usia = YEAR(CURDATE()) - YEAR(Tanggal_Lahir)
    WHERE NRP = p_NRP;
END;

CALL InsertAndUpdateAlumnus('NRP108', 'Zainaf Sari', '1991-09-15', 'Jl. Melinjo No. 89', 'Kediri', '081234567300', 'zainab.sari@yahoo.com', 2009, 2013, 'F', 'PK089', NULL);
