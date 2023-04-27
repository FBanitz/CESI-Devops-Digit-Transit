import "../styles/questions.css";
import React from "react"
import AnswerArea from "./AnswerArea"

class AnswersArea extends React.Component {
  render() {
    const responseOptions = this.props.responseOptions;
    const onQuestionAnswered = this.props.onQuestionAnswered;

    return (
      <div className="flex flex-col mt-6">
        <div className="flex flex-row space-x-4">
          {responseOptions.map((responseOption) => (
            <AnswerArea key={responseOption.id} responseOption={responseOption} onQuestionAnswered={onQuestionAnswered} />
          ))}
        </div>

      </div>
    );
  }
}

export default AnswersArea;