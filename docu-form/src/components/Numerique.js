import { questionsNumerique } from "../data/QuestionsNumerique";

import "../styles/rapport.css"

function Numerique() {
    return (
        <div>
            <h1 className="text-zinc-50 text-2xl">Axe Numérique</h1>
            {questionsNumerique.map((question) => (
                <div key={question.id}>
                    <p className="text-zinc-50">{question.question}</p>
                </div>
            ))}
        </div>
    );
}

export default Numerique
