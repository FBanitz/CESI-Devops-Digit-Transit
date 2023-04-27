import { useEffect } from "react"
import { Link } from 'react-router-dom';
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import "../styles/home.css"

function Home() {
  useEffect(() => { document.title = "Accueil - DIAGNOST'IT" });

  return (
    <div className="flex flex-col">
      <Banner />
      <div className="flex flex-col justify-center items-center h-screen">
        <h1 className="text-5xl text-cyan-50">Entrer le nom de votre entreprise</h1>
        <div>
          <form>
            <input type="text" id="large-input" class="companyInput block  p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-6"/>
          </form>
        </div>
        <Link to="/Questions">
          <div className="takeTest flex justify-center rounded-2xl bg-zinc-950 mt-4">
            <button className="flex justify-center p-2 text-center flex-col">
              <h1 className="text-cyan-50">
                Réaliser le diagnostic de digitalisation de mon entreprise
              </h1>
            </button>
          </div>
        </Link>
      </div>
      <Footer />
    </div>
  );
}

export default Home
