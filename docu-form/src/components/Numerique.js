import { questionsNumerique } from "../data/QuestionsNumerique";

function Numerique() {
    return (
        <div>
            <h1>Axe Compétence</h1>
            {questionsNumerique.map((question) => (
                <div key={question.id}>
                    <p>{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Numerique