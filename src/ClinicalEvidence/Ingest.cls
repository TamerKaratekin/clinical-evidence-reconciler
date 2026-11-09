Class ClinicalEvidence.Ingest Extends Ens.BusinessService
{
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    Quit ..SendRequestSync("ClinicalEvidence.Process",pInput,.pOutput)
}
}
