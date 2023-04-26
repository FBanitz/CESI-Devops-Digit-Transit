import { questionsCompetence } from "../data/QuestionsCompetence";

import "../styles/rapport.css"

function Competence() {
    return (
        <div>
            <h1 className="text-zinc-50 text-2xl">Axe Compétence</h1>
            {questionsCompetence.map((question) => (
                <div key={question.id}>
                    <p className="text-zinc-50">{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Competence
