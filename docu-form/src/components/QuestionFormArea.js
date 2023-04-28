import "../styles/questions.css"
import React from "react"

class QuestionFormArea extends React.Component {
    render() {
        const question = this.props.question;
        return (
            <div className="questionArea bg-zinc-950 rounded-2xl items-center">
                <p className="text-zinc-50">{question.question}</p>
            </div>
        );
    }
}

export default QuestionFormArea
