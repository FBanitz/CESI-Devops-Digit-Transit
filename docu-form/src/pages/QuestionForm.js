
import React from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import QuestionFormArea from "../components/QuestionFormArea.js"
import AnswersArea from "../components/AnswersArea.js"
import { apiGet, apiOperators, apiPost, apiSimpleFilter } from '../api.js';
import "../styles/questions.css"

class QuestionForm extends React.Component {


  
  constructor (props)  {
    super(props);

    const siteUrl = window.location.search;
    const urlParams = new URLSearchParams(siteUrl);
    const diagnosticId = urlParams.get('diagnosticId');

    console.log(diagnosticId)

    const questionIndex = urlParams.get('questionIndex');

    console.log(questionIndex)


    this.state = {
      axis: null,
      questions: null,
      question: null,
      questionIndex: questionIndex ?? 0,
      responseOptions: null,
      isComplete: false,
      diagnosticId: diagnosticId,
    };
  }

  async getAxis(id) {
    let axisRoute = '/items/axis/' + id;

    const axisRes = await apiGet(
      axisRoute,
    )

    const axisJson = await axisRes.json()

    return axisJson.data;
  }

  async getQuestions() {
    let questionRoute = '/items/question/'

    
    const questionRes = await apiGet(
      questionRoute,
    )

    const questionJson = await questionRes.json()

    return questionJson.data;
  }

  async getResponseOptions(questionId) {
    let responseOptionsRoute = '/items/response_option';

    const responseOptionsRes = await apiGet(
      responseOptionsRoute,
      {
        "filter": apiSimpleFilter("question_id", apiOperators.equals, questionId),
      }
    )

    const responseOptionsJson = await responseOptionsRes.json()

    return responseOptionsJson.data;
  }

  createResponse(responseOptionId) {
    let responseRoute = '/items/response';

    apiPost(
      responseRoute,
      null,
      {
        "response_option_id": responseOptionId,
        "diagnostic_id": this.state.diagnosticId,
      },
    )
  }
  
  incrementQuestionIndex() {
    let questionIndex = this.state.questionIndex + 1;

    if (questionIndex === this.state.questions.length) {
      this.setState({ isComplete: true })
    }

    this.setState({ questionIndex: questionIndex })

    return questionIndex;
  }

  async onQuestionAnswered(answerId) {
    this.incrementQuestionIndex()

    if (this.state.isComplete) {
      this.setState({ isComplete: true })
      return
    }

    console.log(this.state.questionIndex)
    console.log(this.state.questions)

    const question = this.state.questions[this.state.questionIndex]

    let axis
    if (question.axis_id !== this.state.axis?.id) {
      axis = await this.getAxis(question.axis_id)
    } else {
      axis = this.state.axis
    }

    let responseOptions = await this.getResponseOptions(question.id)

    this.createResponse(answerId)

    this.setState({
      axis: axis,
      question: question,
      responseOptions: responseOptions,
    })
  }

  async init() {
    const questions = await this.getQuestions()
    
    if (questions.length === this.state.questionIndex) {
      this.setState({ isComplete: true })
      return
    }

    const question = questions[this.state.questionIndex]

    let axis = await this.getAxis(question.axis_id)

    let responseOptions = await this.getResponseOptions(question.id)

    this.setState({
      axis: axis,
      question: question,
      questions: questions,
      responseOptions: responseOptions,
    })
  }

  componentDidMount() {
    this.init()
  }

  render() {
    const question = this.state.question;
    const responseOptions = this.state.responseOptions;

    return (

      <div className="flex flex-col" >
        <Banner />
        {this.state.isComplete ? <div className="flex flex-col justify-center items-center h-screen text-center text-zinc-50"><h1 className="text-3xl font-bold text-center">Merci d'avoir répondu à toutes les questions !</h1></div> :

          <div className="flex flex-col justify-center items-center h-screen text-center text-zinc-50">
            {this.state.axis ? <h1 className="text-3xl font-bold">Axe {this.state.axis.name} </h1> : null}
            {question ? <QuestionFormArea question={question} /> : null}
            {responseOptions ? <AnswersArea responseOptions={responseOptions} onQuestionAnswered={(answerId) => this.onQuestionAnswered(answerId)} /> : null}
          </div>}
        <Footer />
      </div>
    );
  }
}

export default QuestionForm
