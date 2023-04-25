import { Link } from 'react-router-dom';

function Synthese() {
    return (
        <div>
            <h1>Synthèse</h1>

            <h2>Entreprise : Groupe Roederer</h2>

            <p><Link to="/reactivite">Axe Réactivité</Link> : 3.5/5</p>
            <p><Link to="/competences">Axe Compétences</Link> : 4.0/5</p>
            <p><Link to="/numerique">Axe Numérique</Link> : 3.8/5</p>

        </div>
    );
}

export default Synthese