import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import "../styles/home.css"

function Home(){
    return (
        <div className="flex flex-col">
          <Banner />
          <div className="flex justify-center flex-row h-screen mt-6">
            <div className="takeTest flex rounded-2xl bg-cyan-600">
              <div className="flex flex-row">
                <h1 className="flex items-center justify-center">Réaliser le diagnostic de digitalisation de mon entreprise</h1>
              </div>
            </div>
          </div>
          <Footer />
        </div>
    );
}

export default Home
