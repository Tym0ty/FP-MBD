-- Active: 1719454520870@@127.0.0.1@3306@fp_mbd
ALTER TABLE Alumnus ADD COLUMN IF NOT EXISTS Usia INT;

-- Event Scheduler
SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS update_usia_annually;

-- Buat event baru untuk memperbarui usia setiap tahun
CREATE EVENT update_usia_annually
ON SCHEDULE EVERY 1 YEAR
STARTS NOW()
DO
BEGIN
    UPDATE Alumnus
    SET Usia = YEAR(CURDATE()) - YEAR(Tanggal_Lahir);
END;

-- Jalankan update usia untuk pertama kali
UPDATE Alumnus
    SET Usia = YEAR(CURDATE()) - YEAR(Tanggal_Lahir);