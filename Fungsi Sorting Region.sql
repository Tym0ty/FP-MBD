-- Active: 1719153001263@@127.0.0.1@3306@fp_mbd


CREATE PROCEDURE get_alumnus_by_city(IN city_name VARCHAR(255))
BEGIN
    SELECT *
    FROM Alumnus
    WHERE Asal_Kota = city_name;
END;


CALL get_alumnus_by_city('Banyuwangi');

