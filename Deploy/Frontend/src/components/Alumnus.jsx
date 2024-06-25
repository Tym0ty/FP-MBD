import React, { useState, useEffect } from 'react';
import {
  TextField, Button, Select, MenuItem, FormControl, InputLabel, Table, TableBody,
  TableCell, TableContainer, TableHead, TableRow, Paper, TablePagination
} from '@mui/material';
import './TableStyles.css';

function Alumnus() {
  const [data, setData] = useState([]);
  const [searchType, setSearchType] = useState('allData'); // State for selecting search type
  const [searchCity, setSearchCity] = useState('');
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  // Fetch all alumni data on component mount
  useEffect(() => {
    fetchAllData();
  }, []);

  // Function to fetch all data
  const fetchAllData = () => {
    fetch('http://localhost:3001/alumnus')
      .then(res => res.json())
      .then(data => Array.isArray(data) ? setData(data) : setData([]))
      .catch(err => console.log(err));
  };

  // Handle search based on the selected search type
  const handleSearch = () => {
    let endpoint = '';
    let query = '';

    if (searchType === 'alumnusCity') {
      endpoint = 'http://localhost:3001/alumnus/city';
      query = new URLSearchParams({ city: searchCity }).toString();
    } else if (searchType === 'workCity') {
      endpoint = 'http://localhost:3001/alumnus/work_city';
      query = new URLSearchParams({ city: searchCity }).toString();
    } else if (searchType === 'allData') {
      fetchAllData();
      return;
    }

    fetch(`${endpoint}?${query}`)
      .then(res => res.json())
      .then(data => Array.isArray(data) ? setData(data) : setData([]))
      .catch(err => console.log(err));
  };

  const handleChangePage = (event, newPage) => setPage(newPage);

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <div>
      <FormControl variant="outlined" style={{ marginBottom: '20px', minWidth: 200 }}>
        <InputLabel>Search Type</InputLabel>
        <Select
          value={searchType}
          onChange={(e) => setSearchType(e.target.value)}
          label="Search Type"
        >
          <MenuItem value="allData">Show All Data</MenuItem>
          <MenuItem value="alumnusCity">Search by Alumnus City</MenuItem>
          <MenuItem value="workCity">Search by Work City</MenuItem>
        </Select>
      </FormControl>

      {searchType !== 'allData' && (
        <div style={{ margin: '20px 0', display: 'flex', alignItems: 'center' }}>
          <TextField
            label={searchType === 'alumnusCity' ? "Search by Alumnus City" : "Search by Work City"}
            value={searchCity}
            onChange={(e) => setSearchCity(e.target.value)}
            variant="outlined"
            style={{ marginRight: '10px' }}
          />
          <Button variant="contained" color="primary" onClick={handleSearch}>
            Search
          </Button>
        </div>
      )}

      <TableContainer component={Paper} className="table-container">
        <Table className="full-width-table">
          <TableHead>
            <TableRow>
              <TableCell>NRP</TableCell>
              <TableCell>Nama</TableCell>
              <TableCell>Tanggal Lahir</TableCell>
              <TableCell>Alamat Alumnus</TableCell>
              <TableCell>Asal Kota</TableCell>
              <TableCell>No HP</TableCell>
              <TableCell className="email-column">Email</TableCell>
              <TableCell>Tahun Masuk</TableCell>
              <TableCell>Tahun Lulus</TableCell>
              <TableCell>Jenis Kelamin</TableCell>
              <TableCell>Nama Perusahaan</TableCell>
              <TableCell>Alamat Perusahaan</TableCell>
              <TableCell>Negara</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {data.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((alumnus, index) => (
              <TableRow key={index}>
                <TableCell>{alumnus.NRP}</TableCell>
                <TableCell>{alumnus.Nama}</TableCell>
                <TableCell>{new Date(alumnus.Tanggal_Lahir).toLocaleDateString()}</TableCell>
                <TableCell>{alumnus.Alamat}</TableCell>
                <TableCell>{alumnus.Asal_Kota}</TableCell>
                <TableCell>{alumnus.No_HP}</TableCell>
                <TableCell className="email-column">{alumnus.Email}</TableCell>
                <TableCell>{alumnus.Tahun_Masuk}</TableCell>
                <TableCell>{alumnus.Tahun_Lulus}</TableCell>
                <TableCell>{alumnus.Jenis_Kelamin}</TableCell>
                <TableCell>{alumnus.Nama_Perusahaan}</TableCell>
                <TableCell>{alumnus.Alamat_Perusahaan}</TableCell>
                <TableCell>{alumnus.Negara}</TableCell>
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

export default Alumnus;
