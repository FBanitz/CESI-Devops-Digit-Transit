import { useEffect } from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import CompanyForm from "../components/CompanyForm?"

import "../styles/questions.css"

function Company(){
  useEffect(() => {document.title = "Company - DIAGNOST'IT"});
    return (
        <div className="flex flex-col">
          <Banner />

          <div className="flex flex-col justify-center items-center h-screen text-center text-zinc-50">
            <h1 className="text-4xl">Entrer le nom de votre entreprise</h1>
            <CompanyForm />
          </div>

          <Footer />
        </div>
    );
}

export default Company
