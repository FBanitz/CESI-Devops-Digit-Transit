import React from 'react';

import "../styles/rapport.css"

class Competence extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            questions: null
        };
    }

    componentDidMount() {

        fetch(
            'http://localhost:8055/items/question', {
            "method": 'GET',
            "headers": {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        },
        )
            .then(res => res.json().data)
            .then((json) => this.setState({ questions: json.data }))

    }


    render() {
        const { questions } = this.state;
        return (
            <div>
                <h1 className="text-zinc-50 text-2xl">Axe Compétence</h1>
                <p>{questions}</p>
                {/* {questions.map((question) => (
                    <div key={question.id}>
                        <p className="text-zinc-50">{question.question}</p>
                    </div>
                ))} */}
            </div>
        )
    }
}

export default Competence
