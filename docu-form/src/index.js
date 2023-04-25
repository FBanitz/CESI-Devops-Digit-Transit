import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

// import Home from './components/Home'
import Competences from './components/Competences'
import Reactivite from './components/Reactivite'
import Numerique from './components/Numerique'
import Synthese from './components/Synthese'

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <Router>
      <Routes>
        {/* <Route path="/" element={<Home />}></Route> */}
        <Route path="/competences" element={<Competences />}></Route>
        <Route path="/reactivite" element={<Reactivite />}></Route>
        <Route path="/numerique" element={<Numerique />}></Route>
        {/* <Route path="/synthese" element={<Synthese />}></Route> */}
        <Route path="/" element={<Synthese />}></Route>
      </Routes>
    </Router>
  </React.StrictMode>
)
