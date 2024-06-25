import React, { useEffect, useState } from "react";
import {
  Paper,
  TextField,
  Button,
  Select,
  MenuItem,
} from '@mui/material';
import './TableStyles.css';

function Pekerjaan() {
  const [formData, setFormData] = useState({
    NRP: '',
    Nama: '',
    Tanggal_Lahir: '',
    Alamat: '',
    Asal_Kota: '',
    No_HP: '',
    Email: '',
    Tahun_Masuk: '',
    Tahun_Lulus: '',
    Jenis_Kelamin: '',
    ID_Pekerjaan: '',
  });

  const [jobOptions, setJobOptions] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3001/pekerjaan/namapekerjaan')
      .then(res => res.json())
      .then(data => {
        setJobOptions(data); // Assuming data is an array of objects with Nama_Pekerjaan and Id_Pekerjaan
      })
      .catch(err => console.error('Error fetching job options:', err));
  }, []);

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleInsertAlumnus = () => {
    if (!validateForm()) {
      alert('Please fill in all fields correctly.');
      return;
    }

    console.log('Sending data:', formData);

    fetch('http://localhost:3001/alumnus/insert_alumnus', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),
    })
      .then(res => res.json())
      .then(data => {
        console.log('Insertion successful:', data.message);
        resetForm();
      })
      .catch(err => console.error('Error inserting alumnus:', err));
  };

  const validateForm = () => {
    const { NRP, Nama, Tanggal_Lahir, Alamat, Asal_Kota, No_HP, Email, Tahun_Masuk, Tahun_Lulus, Jenis_Kelamin, ID_Pekerjaan } = formData;
    return (
      NRP !== '' &&
      Nama !== '' &&
      Tanggal_Lahir !== '' &&
      Alamat !== '' &&
      Asal_Kota !== '' &&
      No_HP !== '' &&
      Email !== '' &&
      !isNaN(parseInt(Tahun_Masuk)) &&
      !isNaN(parseInt(Tahun_Lulus)) &&
      ['F', 'M'].includes(Jenis_Kelamin.toUpperCase()) &&
      ID_Pekerjaan.length === 5
    );
  };

  const resetForm = () => {
    setFormData({
      NRP: '',
      Nama: '',
      Tanggal_Lahir: '',
      Alamat: '',
      Asal_Kota: '',
      No_HP: '',
      Email: '',
      Tahun_Masuk: '',
      Tahun_Lulus: '',
      Jenis_Kelamin: '',
      ID_Pekerjaan: '',
    });
  };

  return (
    <div>
      <Paper elevation={3} style={{ padding: '20px', marginTop: '25px' }}>
        <h2>Insert New Alumnus</h2>
        <TextField
          name="NRP"
          label="NRP"
          value={formData.NRP}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
          InputLabelProps={{
            shrink: true,
          }}
        />
        <TextField
          name="Nama"
          label="Nama"
          value={formData.Nama}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Tanggal_Lahir"
          label="Tanggal Lahir"
          type="date"
          value={formData.Tanggal_Lahir}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
          InputLabelProps={{
            shrink: true,
          }}
          inputProps={{
            pattern: '\\d{4}-\\d{2}-\\d{2}',
          }}
        />
        <TextField
          name="Alamat"
          label="Alamat"
          value={formData.Alamat}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Asal_Kota"
          label="Asal Kota"
          value={formData.Asal_Kota}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="No_HP"
          label="No HP"
          value={formData.No_HP}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Email"
          label="Email"
          value={formData.Email}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Tahun_Masuk"
          label="Tahun Masuk"
          type="number"
          value={formData.Tahun_Masuk}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Tahun_Lulus"
          label="Tahun Lulus"
          type="number"
          value={formData.Tahun_Lulus}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        />
        <TextField
          name="Jenis_Kelamin"
          label="Jenis Kelamin (F/M)"
          value={formData.Jenis_Kelamin}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
          inputProps={{ maxLength: 1 }}
        />
        <Select
          name="ID_Pekerjaan"
          label="ID Pekerjaan"
          value={formData.ID_Pekerjaan}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
        >
          {jobOptions.map(job => (
            <MenuItem key={job.Id_Pekerjaan} value={job.Id_Pekerjaan}>{job.Nama_Pekerjaan}</MenuItem>
          ))}
        </Select>
        <Button variant="contained" color="primary" padding ='25px' onClick={handleInsertAlumnus}>
          Insert Alumnus
        </Button>
      </Paper>
    </div>
  );
}

export default Pekerjaan;
