Class ClinicalEvidence.AIOperation Extends Ens.BusinessOperation
{
Parameter INVOCATION = "Queue";

Method OnMessage(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    Set pResponse=##class(ClinicalEvidence.Response).%New()
    Set pResponse.CaseId=pRequest.CaseId
    Set pResponse.PolicyVersion=$Get(^ClinicalEvidence.Policy("current"),"1.0")
    Set pResponse.Disposition="REVIEW"
    Set pResponse.Explanation="No valid agent output; manual review required"
    Set pResponse.UsedAI=0

    Set agent=##class(ClinicalEvidence.Agent).%New()
    Set sc=agent.%Init()
    If $SYSTEM.Status.IsError(sc) Quit sc
    Set session=agent.CreateSession()
    Set answer=agent.Chat(session,"Review synthetic referral "_pRequest.CaseId_". Call both evidence and policy tools. Return only the requested JSON.")
    Set raw=answer.Content
    Set ^ClinicalEvidence.RawAgent(pRequest.CaseId) = raw
    // A model answer is never trusted as a clinical conclusion.
    Try {
        Set obj=##class(%DynamicObject).%FromJSON(raw)
        Set disposition=obj.%Get("disposition")
        If (disposition="READY")!(disposition="NEEDS_INFO")!(disposition="REVIEW") {
            Set pResponse.Disposition=disposition
            Set pResponse.Explanation=obj.%Get("explanation")
            Set pResponse.UsedAI=1
        }
    } Catch ex {
        Set pResponse.Explanation="Unparseable agent answer; manual review required"
    }
    Quit 1
}
}
