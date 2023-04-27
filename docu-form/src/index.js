import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import "./styles/index.css"

import Home from './pages/Home'
import Company from './pages/Company'

import QuestionList from './pages/QuestionList'
import Synthese from './components/Synthese'
import QuestionForm from './pages/QuestionForm';

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <Router>
      <Routes>
        {/* <Route path="/" element={<Home />}></Route> */}
        <Route path="/competences" element={<QuestionList axisId='1' />}></Route>
        <Route path="/numerique" element={<QuestionList axisId='2' />}></Route>
        <Route path="/reactivite" element={<QuestionList axisId='3' />}></Route>
        {/* <Route path="/synthese" element={<Synthese />}></Route> */}
        <Route path="/synthese" element={<Synthese />}></Route>
        <Route path="/" element={<Home />}></Route>
        <Route path="/questions" element={<QuestionForm />}></Route>
        <Route path="/company" element={<Company />}></Route>
      </Routes>
    </Router>
  </React.StrictMode>
)
