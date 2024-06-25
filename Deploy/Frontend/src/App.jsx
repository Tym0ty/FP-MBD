import React from 'react';
import { Link, Outlet } from 'react-router-dom';
import { AppBar, Toolbar, Button, Container, Typography } from '@mui/material';
import './App.css';

function App() {
  return (
    <div>
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6" sx={{ flexGrow: 2 }}>
            Dashboard
          </Typography>
          <Button color="inherit" component={Link} to="/alumnus">Data Alumnus</Button>
          <Button color="inherit" component={Link} to="/pekerjaan">Data Pekerjaan</Button>
          <Button color="inherit" component={Link} to="/perusahaan">Data Perusahaan</Button>
          <Button color="inherit" component={Link} to="/insertdata">Insert Data</Button>
        </Toolbar>
      </AppBar>
      <Container sx={{ marginTop: 2 }}>
        <Outlet />
      </Container>
    </div>
  );
}

export default App;
