import { Link } from 'react-router-dom';

import "../styles/rapport.css"

function Synthese() {
    return (
        <div>
            <h1 className="text-zinc-50 text-2xl">Synthèse</h1>

            <h2 className="text-zinc-50 text-xl">Entreprise : Groupe Roederer</h2>

            <p className="text-zinc-50"><Link to="/reactivite">Axe Réactivité</Link> : 3.5/5</p>
            <p className="text-zinc-50"><Link to="/competences">Axe Compétences</Link> : 4.0/5</p>
            <p className="text-zinc-50"><Link to="/numerique">Axe Numérique</Link> : 3.8/5</p>

        </div>
    );
}

export default Synthese
