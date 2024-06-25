-- Active: 1719310112817@@127.0.0.1@3306@fp_mbd


CREATE PROCEDURE get_alumnus_by_name(IN alumnus_name VARCHAR(100))
BEGIN
    SELECT *
    FROM Alumnus
    WHERE Nama = alumnus_name;
END;


CALL get_alumnus_by_name('Rina Setiawati');

