import React, { useEffect, useState } from "react";
import {
  Paper,
  TextField,
  Button,
} from '@mui/material';
import './TableStyles.css';

function Pekerjaan() {

  // State variables for the new Alumnus form
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

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleInsertAlumnus = () => {
    // Validate form fields
    if (!validateForm()) {
      alert('Please fill in all fields correctly.');
      return;
    }

    // Log data being sent
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

      <Paper elevation={3} style={{ padding: '20px', marginTop: '20px' }}>
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
        <TextField
          name="ID_Pekerjaan"
          label="ID Pekerjaan"
          value={formData.ID_Pekerjaan}
          onChange={handleInputChange}
          fullWidth
          margin="normal"
          inputProps={{ maxLength: 5 }}
        />
        <Button variant="contained" color="primary" onClick={handleInsertAlumnus}>
          Insert Alumnus
        </Button>
      </Paper>
    </div>
  );
}

export default Pekerjaan;
