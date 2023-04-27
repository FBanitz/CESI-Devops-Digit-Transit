import React from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import "../styles/home.css"
import apiEndpoint from "../api.js";
import { Navigate, useNavigate } from "react-router-dom";
// class Home extends React.Component {
function Home() {

  const navigate = useNavigate();
  function onStartForm() {
    const companyInput = document.getElementById("large-input").value;
    const companyEndpoint = apiEndpoint + '/items/company';
    // const navigate = useNavigate();


    console.log("Adding company: " + companyInput + " to database")
    fetch(
      companyEndpoint + '?query={"name":{_eq:"' + companyInput + '"}}', {
      "method": 'GET',
      "headers": {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
    },
    ).then(res => res.json())
      .then((json) => {
        if (json.data && json.data.length > 0) {
          var company = json.data[0]
          console.log("Company already exists")
          fetch(
            apiEndpoint + '/items/diagnostic?query={"company_id":{_eq:' + company.id + '}}',
            {
              "method": 'GET',
              "headers": {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              },
            },
          ).then(res => res.json())
            .then((json) => {
              if (json.data.length > 0) {
                console.log("Diagnostic already exists")
                if (json.data[0].complete) {
                  console.log("Diagnostic already complete")
                  return navigate("/synthese")
                } else {
                  console.log("Diagnostic not complete")
                  return navigate("/questions")
                }
              }
              else {
                fetch(
                  apiEndpoint + '/items/diagnostic/',
                  {
                    "method": 'POST',
                    "headers": {
                      'Accept': 'application/json',
                      'Content-Type': 'application/json',
                    },
                    "body": JSON.stringify({
                      "company_id": company.id,
                    }),
                  },
                ).then(res => res.json())
                  .then((json) => {
                    const diagnosticId = json.data.id
                    console.log("Diagnostic id: " + diagnosticId)
                    return navigate("/competences")
                  })
              }
            })
        }
        else {
          fetch(
            companyEndpoint, {
            "method": 'POST',
            "headers": {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            "body": JSON.stringify({
              "name": companyInput,
            })
          }).then(res => res.json())
            .then((json) => {
              const companyId = json.data.id
              console.log("Company id: " + companyId)
              fetch(
                apiEndpoint + '/items/diagnostic/',
                {
                  "method": 'POST',
                  "headers": {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                  },
                  "body": JSON.stringify({
                    "company_id": companyId,
                  }),
                },
              ).then(res => res.json())
                .then((json) => {
                  const diagnosticId = json.data.id
                  console.log("Diagnostic id: " + diagnosticId)
                  return navigate("/questions")
                })
            })
        }
      })
  }

  return (
    <div className="flex flex-col">
      <Banner />
      <div className="flex flex-col justify-center items-center h-screen">
        <h1 className="text-5xl text-cyan-50">Entrer le nom de votre entreprise</h1>
        <div>
          <form>
            <input type="text" id="large-input" class="companyInput block  p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-6" />
          </form>
        </div>
        <a onClick={() => {
          onStartForm()
        }}>
          <div className="takeTest flex justify-center rounded-2xl bg-zinc-950 mt-4">
            <button className="flex justify-center p-2 text-center flex-col">
              <h1 className="text-cyan-50">
                Réaliser le diagnostic de digitalisation de mon entreprise
              </h1>
            </button>
          </div>
        </a>
      </div>
      <Footer />
    </div>
  );
}
export default Home
