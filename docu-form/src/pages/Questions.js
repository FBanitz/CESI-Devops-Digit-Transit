import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import QuestionArea from "../components/QuestionArea"
import AnswerArea from "../components/AnswerArea"

import "../styles/questions.css"

function Questions(){
    return (
        <div className="flex flex-col">
          <Banner />
          <div className="flex flex-col justify-center items-center h-screen">
                  <QuestionArea/>
                  <AnswerArea/>
          </div>

          <Footer />
        </div>
    );
}

export default Questions
