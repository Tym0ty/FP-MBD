-- Active: 1719251590957@@127.0.0.1@3306@fp_mbd

# Index 
CREATE INDEX idx_nama_alumnus ON Alumnus(Nama);

CREATE PROCEDURE get_alumnus_by_name(IN alumnus_name VARCHAR(100))
BEGIN
    SELECT *
    FROM Alumnus
    WHERE 
        Alumnus.Nama LIKE CONCAT('%', alumnus_name, '%');
END;

CALL get_alumnus_by_name('a');

