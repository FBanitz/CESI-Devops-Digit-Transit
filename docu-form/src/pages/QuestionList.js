import React from 'react';

import "../styles/rapport.css"
import { apiEndpoint } from '../api';


class QuestionList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            axisId: props.axisId,
            axis: null,
            questions: null
        };
    }

    componentDidMount() {

        let axisId = this.state.axisId;

        let questionEndpoint = apiEndpoint + '/items/question';

        if (axisId) {
            let axisEndpoint = apiEndpoint + '/items/axis/' + axisId;

            fetch(
                axisEndpoint, {
                "method": 'GET',
                "headers": {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }
            },
            )
                .then(res => res.json())
                .then((json) => {
                    this.setState({ axis: json.data })

                        // (json.data)
                        (this.state.axis)
                });


            questionEndpoint += '?filter={"axis_id": {"_eq": ' + axisId + '}}';

        }

        fetch(
            questionEndpoint, {
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
                    (this.state.questions)
            })

    }


    render() {
        const { questions } = this.state;
        const { axis } = this.state;
        return (
            <div>
                {axis ? <h1 className="text-zinc-50 text-2xl">Questions axe {axis.name}</h1> : <h1 className="text-zinc-50 text-2xl">Questions</h1>}
                {questions ?
                    questions.map((question) => (
                        <div key={question.id}>
                            <p className="text-zinc-50">{question.question}</p>
                        </div>
                    )) : null
                }
            </div>
        )
    }
}

export default QuestionList
