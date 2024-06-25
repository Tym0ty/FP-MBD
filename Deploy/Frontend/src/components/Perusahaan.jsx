import React, { useEffect, useState } from "react";
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, TablePagination } from '@mui/material';
import './TableStyles.css';

function Perusahaan() {
  const [data, setData] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  useEffect(() => {
    fetch('http://localhost:3001/perusahaan')
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
    <TableContainer component={Paper} className="table-container">
      <Table className="full-width-table">
        <TableHead>
          <TableRow sx={{ backgroundColor: '#1976d2' }}>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Perusahaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Nama Perusahaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Bidang Industri</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Alamat</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Negara</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Kontak</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Pendapatan Tahunan</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((perusahaan, index) => (
            <TableRow key={index} sx={{ '&:nth-of-type(even)': { backgroundColor: '#f3f3f3' }, '&:hover': { backgroundColor: '#f5f5f5' } }}>
              <TableCell>{perusahaan.Id_Perusahaan}</TableCell>
              <TableCell>{perusahaan.Nama_Perusahaan}</TableCell>
              <TableCell>{perusahaan.Bidang_Industri}</TableCell>
              <TableCell>{perusahaan.Alamat}</TableCell>
              <TableCell>{perusahaan.Negara}</TableCell>
              <TableCell>{perusahaan.Kontak}</TableCell>
              <TableCell>{perusahaan.Pendapatan_Tahunan}</TableCell>
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

export default Perusahaan;
