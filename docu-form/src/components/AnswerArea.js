import "../styles/questions.css";

function AnswerArea() {

    return (
      <div className="flex flex-col mt-6">
        <div className="flex flex-row space-x-4">
          <div className="answerArea bg-zinc-950 rounded-2xl"></div>
          <div className="answerArea bg-zinc-950 rounded-2xl"></div>
          <div className="answerArea bg-zinc-950 rounded-2xl"></div>
        </div>
          <div className="flex flex-row justify-center items-center mt-6">
          <div className="answerArea bg-zinc-950 rounded-2xl items-center justify-center"><p>Revenir à la question précédente</p></div>
        </div>
      </div>
    );
}



export default AnswerArea;
