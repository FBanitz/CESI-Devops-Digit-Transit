import { questionsReactivite } from "../data/QuestionsReactivite";

function Reactivite() {
    return (
        <div>
            <h1>Axe Compétence</h1>
            {questionsReactivite.map((question) => (
                <div key={question.id}>
                    <p>{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Reactivite