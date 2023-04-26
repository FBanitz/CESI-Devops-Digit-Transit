import React from 'react';

import "../styles/rapport.css"

const numeriqueAxisId = 2;

class Numerique extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            questions: null
        };
    }

    componentDidMount() {

        fetch(
            'http://localhost:8055/items/question?filter={"axis_id": {"_eq": '+numeriqueAxisId+'}}', {
            "method": 'GET',
            "headers": {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                
            },
        },
        )
            .then(res => res.json())
            .then((json) => {
                this.setState({ questions: json.data })

                // console.log(json.data)
                // console.log(this.state.questions)
            })

    }


    render() {
        const { questions } = this.state;
        return (
            <div>
                <h1 className="text-zinc-50 text-2xl">Axe Numérique</h1>
                {/* <p>{questions}</p> */}
                {questions?
                questions.map((question) => (
                    <div key={question.id}>
                        <p className="text-zinc-50">{question.question}</p>
                    </div>
                )):null
                }
            </div>
        )
    }
}

export default Numerique

