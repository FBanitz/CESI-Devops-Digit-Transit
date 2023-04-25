import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import QuestionArea from "../components/QuestionArea"

import "../styles/questions.css"

function Questions(){
    return (
        <div className="flex flex-col">
          <Banner />

          <QuestionArea />
          <Footer />
        </div>
    );
}

export default Questions
