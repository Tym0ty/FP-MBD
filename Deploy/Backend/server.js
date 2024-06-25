const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());

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