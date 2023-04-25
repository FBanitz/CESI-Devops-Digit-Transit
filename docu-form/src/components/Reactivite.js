import { questionsReactivite } from "../data/QuestionsReactivite";

import "../styles/rapport.css"

function Reactivite() {
    return (
        <div>
            <h1 className="text-zinc-50 text-2xl">Axe Réactivité</h1>
            {questionsReactivite.map((question) => (
                <div key={question.id}>
                    <p className="text-zinc-50">{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Reactivite
