import { Link } from 'react-router-dom';

import Competences from './Competences'
import Reactivite from './Reactivite'
import Numerique from './Numerique'

function Synthese() {
    return (
        <div>
            <h1>Synthèse</h1>

            <h2>Entreprise : Groupe Roederer</h2>

            <p><Link to="/Reactivite">Axe Réactivité</Link> : 3.5/5</p>
            <p><Link to="/Competences">Axe Compétences</Link> : 4.0/5</p>
            <p><Link to="/Numerique">Axe Numérique</Link> : 3.8/5</p>
        </div>
    );
}

export default Synthese