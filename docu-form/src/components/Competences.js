import { questionsCompetence } from "../data/QuestionsCompetence";

function Competence() {
    return (
        <div>
            <h1>Axe Compétence</h1>
            {questionsCompetence.map((question) => (
                <div key={question.id}>
                    <p>{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Competence