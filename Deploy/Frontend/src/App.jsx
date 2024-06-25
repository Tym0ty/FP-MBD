import React, { useEffect, useState } from "react";

function app() {
  const [data, setData] = useState([]);
  useEffect (() => {
    fetch('http://localhost:3001/alumnus')
    .then(res => res.json())
    .then(data => setData(data))
    .catch(err => console.log(err));
  }, []);
  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>Nama</th>
            <th>Asal Kota</th>
            <th>Alamat</th>
          </tr>
        </thead>
        <tbody>
          {data.map((alumnus, index) => (
            <tr key={index}>
              <td>{alumnus.Nama}</td>
              <td>{alumnus.Asal_Kota}</td>
              <td>{alumnus.Alamat}</td>
            </tr>
          ))}
        </tbody>
      </table>

    </div>
  );
}

export default app;