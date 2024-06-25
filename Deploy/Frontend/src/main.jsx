import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import App from './App.jsx'
import Alumnus from './components/Alumnus.jsx'
import Pekerjaan from './components/Pekerjaan.jsx'
import Perusahaan from './components/Perusahaan.jsx'
import Insertdata from './components/Insertdata.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path="/" element={<App />}>
          <Route path="alumnus" element={<Alumnus />} />
          <Route path="pekerjaan" element={<Pekerjaan />} />
          <Route path="perusahaan" element={<Perusahaan />} />
          <Route path="insertdata" element={<Insertdata />} />
        </Route>
      </Routes>
    </Router>
  </React.StrictMode>,
);
