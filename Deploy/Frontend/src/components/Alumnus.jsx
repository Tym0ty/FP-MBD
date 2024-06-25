import React, { useEffect, useState } from "react";
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, TablePagination } from '@mui/material';

function Alumnus() {
  const [data, setData] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  useEffect(() => {
    fetch('http://localhost:3001/alumnus')
      .then(res => res.json())
      .then(data => setData(data))
      .catch(err => console.log(err));
  }, []);

  const handleChangePage = (event, newPage) => setPage(newPage);

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <TableContainer component={Paper}>
      <Table>
        <TableHead>
          <TableRow sx={{ backgroundColor: '#1976d2' }}>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>NRP</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Nama</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Tanggal Lahir</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Alamat</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Asal Kota</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>No HP</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Email</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Tahun Masuk</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Tahun Lulus</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Jenis Kelamin</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Pekerjaan</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((alumnus, index) => (
            <TableRow key={index} sx={{ '&:nth-of-type(even)': { backgroundColor: '#f3f3f3' }, '&:hover': { backgroundColor: '#f5f5f5' } }}>
              <TableCell>{alumnus.NRP}</TableCell>
              <TableCell>{alumnus.Nama}</TableCell>
              <TableCell>{alumnus.Tanggal_Lahir}</TableCell>
              <TableCell>{alumnus.Alamat}</TableCell>
              <TableCell>{alumnus.Asal_Kota}</TableCell>
              <TableCell>{alumnus.No_HP}</TableCell>
              <TableCell>{alumnus.Email}</TableCell>
              <TableCell>{alumnus.Tahun_Masuk}</TableCell>
              <TableCell>{alumnus.Tahun_Lulus}</TableCell>
              <TableCell>{alumnus.Jenis_Kelamin}</TableCell>
              <TableCell>{alumnus.ID_Pekerjaan}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      <TablePagination
        rowsPerPageOptions={[10, 25, 50]}
        component="div"
        count={data.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </TableContainer>
  );
}

export default Alumnus;
