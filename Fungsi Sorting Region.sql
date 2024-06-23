USE fp_mbd;

DELIMITER $$

CREATE PROCEDURE fp_mbd.get_alumnus_by_city(IN city_name VARCHAR(255))
BEGIN
    SELECT *
    FROM Alumnus
    WHERE Asal_Kota = city_name;
END$$

DELIMITER ;

CALL fp_mbd.get_alumnus_by_city('Banyuwangi');

