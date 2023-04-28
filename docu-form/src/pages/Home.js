import React from "react"
import Banner from "../components/Banner.js"
import Footer from "../components/Footer.js"
import "../styles/home.css"
import { apiGet, apiOperators, apiPost, apiSimpleFilter } from "../api.js";
import { useNavigate } from "react-router-dom";

function Home() {

  const navigate = useNavigate();

  async function getCompany(companyName) {
    const filter = apiSimpleFilter("name", apiOperators.equals, companyName)

    const companiesRes = await apiGet(
      '/items/company',
      {
        "filter": filter,
      }
    )

    if (!companiesRes) {
      return null
    }
  
    const companyJson = await companiesRes.json()

    const company = companyJson.data[0]
    return company
  }

  async function getDiagnostic(companyId) {
    const filter = apiSimpleFilter("company_id", apiOperators.equals, companyId)

    const diagnosticsRes = await apiGet(
      '/items/diagnostic',
      {
        "filter": filter,
      }
    )

    if (!diagnosticsRes) {
      return null
    }

    const diagnosticsJson = await diagnosticsRes.json()

    const diagnostic = diagnosticsJson.data[0]
    return diagnostic
  }

  async function createCompany(companyName) {
    await apiPost(
      '/items/company',
      null,
      {
        "name": companyName,
      },
    )
  }

  async function createDiagnostic(companyId) {
    await apiPost(
      '/items/diagnostic',
      null,
      {
        "company_id": companyId,
      },
    )
  }

  async function getResponses(diagnosticId) {
    const filter = apiSimpleFilter("diagnostic_id", apiOperators.equals, diagnosticId)

    const responsesRes = await apiGet(
      '/items/response',
      {
        "filter": filter,
      }
    )

    const responsesJson = await responsesRes.json()

    const responses = responsesJson.data
    return responses
  }

  async function onStartForm() {
    const companyInput = document.getElementById("companyNameInput").value;

    let company = await getCompany(companyInput)

    if (company) {
      console.log("Company exists")

      let diagnostic = await getDiagnostic(company.id)

      if (diagnostic) {
        console.log("Diagnostic exists")
        if (diagnostic.complete) {
          console.log("Diagnostic complete")
          return navigate("/synthese")
        }

        console.log("Diagnostic not complete")

        console.log("Diagnostic id: " + diagnostic.id)

        const responses = await getResponses(diagnostic.id)

        return navigate("/questions?diagnosticId=" + diagnostic.id + "&questionIndex=" + responses.length)
      }

      console.log("Diagnostic does not exist")
      console.log("Creating diagnostic")
      await createDiagnostic(company.id)

      diagnostic = await getDiagnostic(company.id)
      
      return navigate(
        "/questions?diagnosticId=" + diagnostic.id,
      )
    }

    console.log("Company does not exist")
    console.log("Creating company " + companyInput)

    await createCompany(companyInput)

    company = await getCompany(companyInput)

    console.log("Company created: ", company)

    console.log("Creating diagnostic")

    await createDiagnostic(company.id)

    const diagnostic = await getDiagnostic(company.id)

    return navigate(
      "/questions?diagnosticId=" + diagnostic.id,
    )
  }

  return (
    <div className="flex flex-col">
      <Banner />
      <div className="flex flex-col justify-center items-center h-screen">
        <h1 className="text-5xl text-cyan-50">Entrer le nom de votre entreprise</h1>
        <div>
          <form>
            <input type="text" id="companyNameInput" class="companyInput block  p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-6" />
          </form>
        </div>
          <div className="takeTest flex justify-center rounded-2xl bg-zinc-950 mt-4">
            <button className="flex justify-center p-2 text-center flex-col"
              onClick={() => {
                onStartForm()
              }}
              href="/questions"
            >
              <h1 className="text-cyan-50">
                Réaliser le diagnostic de digitalisation de mon entreprise
              </h1>
            </button>
          </div>
      </div>
      <Footer />
    </div>
  );
}
export default Home
