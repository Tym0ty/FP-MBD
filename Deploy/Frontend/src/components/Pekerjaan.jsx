import React, { useEffect, useState } from "react";
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, TablePagination } from '@mui/material';

function Pekerjaan() {
  const [data, setData] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  useEffect(() => {
    fetch('http://localhost:3001/pekerjaan')
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
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Pekerjaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>Nama Pekerjaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Kategori Pekerjaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Perusahaan</TableCell>
            <TableCell sx={{ color: 'white', fontWeight: 'bold' }}>ID Instansi Pendidikan</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((pekerjaan, index) => (
            <TableRow key={index} sx={{ '&:nth-of-type(even)': { backgroundColor: '#f3f3f3' }, '&:hover': { backgroundColor: '#f5f5f5' } }}>
              <TableCell>{pekerjaan.Id_Pekerjaan}</TableCell>
              <TableCell>{pekerjaan.Nama_Pekerjaan}</TableCell>
              <TableCell>{pekerjaan.Id_Kategori_Pekerjaan}</TableCell>
              <TableCell>{pekerjaan.Id_Perusahaan}</TableCell>
              <TableCell>{pekerjaan.Id_Instansi_Pendidikan}</TableCell>
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

export default Pekerjaan;
