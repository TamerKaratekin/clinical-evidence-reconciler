Class ClinicalEvidence.Process Extends Ens.BusinessProcess
{
Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    Set sc=..SendRequestSync("ClinicalEvidence.AI",pRequest,.pResponse)
    If $SYSTEM.Status.IsError(sc) {
        Set pResponse=##class(ClinicalEvidence.Response).%New()
        Set pResponse.CaseId=pRequest.CaseId
        Set pResponse.Disposition="REVIEW"
        Set pResponse.Explanation="Agent call failed; manual review required"
        Set pResponse.UsedAI=0
    }
    If '$IsObject(pResponse) {
        Set pResponse=##class(ClinicalEvidence.Response).%New()
        Set pResponse.CaseId=pRequest.CaseId
        Set pResponse.Disposition="REVIEW"
        Set pResponse.Explanation="No agent output; manual review required"
        Set pResponse.UsedAI=0
    }
    Set ^ClinicalEvidence.Audit(pRequest.CaseId,$ZDateTime($Horolog,3))=pResponse.Disposition_" | "_pResponse.Explanation
    Quit 1
}
}
