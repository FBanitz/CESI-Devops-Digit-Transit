import { useEffect } from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import QuestionArea from "../components/QuestionArea"
import AnswerArea from "../components/AnswerArea"

import "../styles/questions.css"

function Questions(){
  useEffect(() => {document.title = "Questions - DIAGNOST'IT"});
    return (
        <div className="flex flex-col">
          <Banner />
          <div className="flex flex-col justify-center items-center h-screen text-center text-zinc-50">
                  <QuestionArea/>
                  <AnswerArea/>
          </div>

          <Footer />
        </div>
    );
}

export default Questions
