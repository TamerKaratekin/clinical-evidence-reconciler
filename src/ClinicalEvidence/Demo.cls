Class ClinicalEvidence.Demo Extends %RegisteredObject
{
ClassMethod Run(caseId As %String = "IBD-001") As %Status
{
    If '$Data(^ClinicalEvidence.Case(caseId)) Do ##class(ClinicalEvidence.Data).Seed()
    Set sc=##class(Ens.Director).StartProduction("ClinicalEvidence.Production")
    If $SYSTEM.Status.IsError(sc) {
        Set startError=$SYSTEM.Status.GetErrorText(sc)
        // A second test run may find this production already running. Reuse it.
        If ('$FIND(startError,"ErrProductionAlreadyRunning"))!('$FIND(startError,"ClinicalEvidence.Production")) {
            Write "START ERROR: ",startError,!
            Quit sc
        }
        Write "Production already running; reusing active production.",!
    }
    Set sc=##class(Ens.Director).CreateBusinessService("ClinicalEvidence.Ingest",.service)
    If $SYSTEM.Status.IsError(sc) Write "SERVICE ERROR: ",$SYSTEM.Status.GetErrorText(sc),! Quit sc
    Set request=##class(ClinicalEvidence.Request).%New()
    Set request.CaseId=caseId
    Set sc=service.ProcessInput(request,.response)
    If $SYSTEM.Status.IsError(sc) Write "REQUEST ERROR: ",$SYSTEM.Status.GetErrorText(sc),! Quit sc
    If $IsObject(response) {
        Write "CASE: ",response.CaseId,!
        Write "DISPOSITION: ",response.Disposition,!
        Write "POLICY: ",response.PolicyVersion,!
        Write "AI USED: ",response.UsedAI,!
        Write "EXPLANATION: ",response.Explanation,!
    } Else {
        Write "No response returned",!
    }
    Quit sc
}
}
