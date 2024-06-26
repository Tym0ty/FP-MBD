const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: 'root',
    password: '',
    database: 'fp_mbd'
});

app.get('/', (req, res) => {
    return res.json("Hello World");
});

app.get('/alumnus', (req, res) => {
    const sql = "SELECT * FROM Alumnus;";
    db.query(sql, (err, data) => {
        if (err) {
            console.log(err);
        }
        return res.json(data);
    });
});

app.get('/alumnus/city', (req, res) => {
    const cityName = req.query.city;
    if (!cityName) {
        return res.status(400).json({ error: 'City name is required' });
    }
    const sql = `CALL get_alumnus_by_city(?);`;
    db.query(sql, [cityName], (err, results) => {
        if (err) {
            console.log('Database Error:', err);
            return res.status(500).json({ error: err.message });
        }
        console.log('Results:', results);
        return res.json(results[0] || []);
    });
});

app.get('/alumnus/work_city', (req, res) => {
    const cityName = req.query.city;
    if (!cityName) {
        return res.status(400).json({ error: 'City name is required' });
    }
    const sql = `CALL FilterAlumnusByWorkCity(?);`;
    db.query(sql, [cityName], (err, results) => {
        if (err) {
            console.log('Database Error:', err);
            return res.status(500).json({ error: err.message });
        }
        console.log('Results:', results);
        return res.json(results[0] || []);
    });
});

app.get('/alumnus/by_name', (req, res) => {
    const cityName = req.query.city;
    if (!cityName) {
        return res.status(400).json({ error: 'Alumnus name is required' });
    }
    const sql = `CALL get_alumnus_by_name(?);`;
    db.query(sql, [cityName], (err, results) => {
        if (err) {
            console.log('Database Error:', err);
            return res.status(500).json({ error: err.message });
        }
        console.log('Results:', results);
        return res.json(results[0] || []);
    });
});


app.post('/alumnus/insert_alumnus', (req, res) => {
    const { NRP, Nama, Tanggal_Lahir, Alamat, Asal_Kota, No_HP, Email, Tahun_Masuk, Tahun_Lulus, Jenis_Kelamin, ID_Pekerjaan, Usia } = req.body;

    const sql = `CALL InsertAndUpdateAlumnus(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);`;
    const values = [NRP, Nama, Tanggal_Lahir, Alamat, Asal_Kota, No_HP, Email, Tahun_Masuk, Tahun_Lulus, Jenis_Kelamin, ID_Pekerjaan, Usia];

    db.query(sql, values, (err, results) => {
        if (err) {
            console.log('Database Error:', err);
            return res.status(500).json({ error: err.message });
        }
        console.log('Insertion successful');
        return res.status(200).json({ message: 'Insertion successful' });
    });
});

app.get('/pekerjaan/namapekerjaan', (req, res) => {
    const sql = "SELECT Nama_Pekerjaan, Id_Pekerjaan FROM Pekerjaan;";
    db.query(sql, (err, data) => {
        if (err) {
            console.log(err);
        }
        return res.json(data);
    });
});

app.get('/pekerjaan', (req, res) => {
    const sql = "SELECT * FROM Pekerjaan;";
    db.query(sql, (err, data) => {
        if (err) {
            console.log(err);
        }
        return res.json(data);
    });
});

app.get('/perusahaan', (req, res) => {
    const sql = "SELECT * FROM Perusahaan;";
    db.query(sql, (err, data) => {
        if (err) {
            console.log(err);
        }
        return res.json(data);
    });
});

app.listen(3001, () => {
    console.log('Server is running on port 3001');
})