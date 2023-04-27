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
      <div className="flex flex-row justify-center items-center h-screen">
        <Link to="/Questions">
          <div className="takeTest flex justify-center rounded-2xl bg-zinc-950">
            <div className="flex justify-center p-2 text-center flex-col">
              <h1 className="text-cyan-50">
                Réaliser le diagnostic de digitalisation de mon entreprise
              </h1>
            </div>
          </div>
        </Link>
      </div>
      <Footer />
    </div>
  );
}

export default Home
