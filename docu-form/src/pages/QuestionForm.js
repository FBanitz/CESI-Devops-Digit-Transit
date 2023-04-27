
import React from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import QuestionFormArea from "../components/QuestionFormArea.js"
import AnswersArea from "../components/AnswersArea.js"

import "../styles/questions.css"

class QuestionForm extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      axis: null,
      questions: null,
      question: null,
      questionIndex: 0,
      responseOptions: null,
      isComplete: false,
    };
  }

  componentDidMount() {
    let questionEndpoint = 'http://localhost:8055/items/question';

    fetch(
      questionEndpoint, {
      "method": 'GET',
      "headers": {
        'Accept': 'application/json',
        'Content-Type': 'application/json',

      },
    },
    )
      .then(res => res.json())
      .then((json) => {
        this.setState({
          questions: json.data,
          question: json.data[this.state.questionIndex],
        })
      })
      .then(() => {
        if (this.state.question) {
          let axisId = this.state.question.axis_id;
          let axisEndpoint = 'http://localhost:8055/items/axis/' + axisId;

          fetch(
            axisEndpoint, {
            "method": 'GET',
            "headers": {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
          },
          )
            .then(res => res.json())
            .then((json) => {
              this.setState({ axis: json.data })
            })
        }
      })
      .then(() => {
        if (this.state.question) {
          let responseOptionsEndpoint = 'http://localhost:8055/items/response_option?filter={"question_id": {"_eq": ' + this.state.question.id + '}}';

          fetch(
            responseOptionsEndpoint, {
            "method": 'GET',
            "headers": {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
          },
          )
            .then(res => res.json())
            .then((json) => {
              this.setState({ responseOptions: json.data })
            })
        }
      }
      )

  }

  onQuestionAnswered(answerId) {
    let questionIndex = this.state.questionIndex + 1;

    if (questionIndex === this.state.questions.length) {
      this.setState({ isComplete: true })
      return
    }

    let axis;
    let question = this.state.questions[questionIndex];
    let responseOptions;

    let responseOptionsEndpoint = 'http://localhost:8055/items/response_option?filter={"question_id": {"_eq": ' + question.id + '}}';

    fetch(
      responseOptionsEndpoint, {
      "method": 'GET',
      "headers": {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
    }
    )
      .then(res => res.json())
      .then((json) => {
        responseOptions = json.data;
      })
      .then(() => {
        let axisEndpoint = 'http://localhost:8055/items/axis/' + question.axis_id;

        fetch(
          axisEndpoint, {
          "method": 'GET',
          "headers": {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }
        }
        )
          .then(res => res.json())
          .then((json) => {
            axis = json.data;
          })


          .then(() => {
            this.setState({
              question: question,
              questionIndex: questionIndex,
              responseOptions: responseOptions,
              axis: axis,
            })
          })
      })
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
