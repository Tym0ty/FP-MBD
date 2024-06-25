import React, { useEffect, useState } from "react";
import { 
  Table, 
  TableBody, 
  TableCell, 
  TableContainer, 
  TableHead, 
  TableRow, 
  Paper, 
  Typography,
  TablePagination 
} from '@mui/material';

function App() {
  const [data, setData] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  useEffect(() => {
    fetch('http://localhost:3001/alumnus')
      .then(res => res.json())
      .then(data => setData(data))
      .catch(err => console.log(err));
  }, []);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <div style={{ padding: '20px' }}>
      <Typography variant="h4" gutterBottom>
        Alumnus Data
      </Typography>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>NRP</TableCell>
              <TableCell>Nama</TableCell>
              <TableCell>Tanggal Lahir</TableCell>
              <TableCell>Alamat</TableCell>
              <TableCell>Asal Kota</TableCell>
              <TableCell>No HP</TableCell>
              <TableCell>Email</TableCell>
              <TableCell>Tahun Masuk</TableCell>
              <TableCell>Tahun Lulus</TableCell>
              <TableCell>Jenis Kelamin</TableCell>
              <TableCell>ID Pekerjaan</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {data.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((alumnus, index) => (
              <TableRow key={index}>
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
    </div>
  );
}

export default App;
