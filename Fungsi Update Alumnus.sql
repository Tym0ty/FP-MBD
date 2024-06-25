CREATE PROCEDURE UpdateAlumnus(
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
    IN p_ID_Pekerjaan CHAR(5)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- ROLLBACK changes if an error occurs
        ROLLBACK;
        -- Optionally, you can log the error or perform other error handling
        SELECT 'An error occurred and the transaction was rolled back.';
    END;

    -- Start a new transaction
    START TRANSACTION;

    -- Update the data in the Alumnus table
    UPDATE Alumnus
    SET
        Nama = p_Nama,
        Tanggal_Lahir = p_Tanggal_Lahir,
        Alamat = p_Alamat,
        Asal_Kota = p_Asal_Kota,
        No_HP = p_No_HP,
        Email = p_Email,
        Tahun_Masuk = p_Tahun_Masuk,
        Tahun_Lulus = p_Tahun_Lulus,
        Jenis_Kelamin = p_Jenis_Kelamin,
        ID_Pekerjaan = p_ID_Pekerjaan
    WHERE NRP = p_NRP;

    -- Commit the transaction
    COMMIT;
END;

-- Call the UpdateAlumnus procedure with sample data
CALL UpdateAlumnus('NRP101', 'Zainaf Sari', '1991-09-15', 'Jl. Melinjo No. 89', 'Kediri', '081234567300', 'zainab.sari@yahoo.com', 2009, 2013, 'F', 'PK089');
