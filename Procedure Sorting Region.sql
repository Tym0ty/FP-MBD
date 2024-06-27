-- Active: 1719251590957@@127.0.0.1@3306@fp_mbd

CREATE INDEX idx_asal_kota_alumnus ON Alumnus(Asal_Kota);

CREATE PROCEDURE get_alumnus_by_city(IN city_name VARCHAR(255))
BEGIN
    SELECT *
    FROM Alumnus
    WHERE Asal_Kota = city_name;
END;


CALL get_alumnus_by_city('Banyuwangi');

