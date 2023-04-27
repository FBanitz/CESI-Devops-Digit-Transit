import "../styles/questions.css";

import React from "react"

class AnswerArea extends React.Component {

  onClick() {
    this.props.onQuestionAnswered(this.props.responseOption.id);
  }

  render() {
    const responseOption = this.props.responseOption;
    return (
      <a href={"#response_option_" + responseOption.id} onClick={() => this.onClick()}>
        <div className="answerArea bg-zinc-950 rounded-2xl items-center">
          <p className="text-zinc-50">{responseOption.response}</p>
        </div>
      </a>
    );
  }
}

export default AnswerArea;
