Class ClinicalEvidence.Tools Extends %AI.Tool
{
/// Retrieve synthetic case evidence by ID. No live patient information is available.
Method GetCaseEvidence(caseId As %String) As %String
{
    Quit $Get(^ClinicalEvidence.Case(caseId),"NO_SUCH_CASE")
}
/// Retrieve the active expert-informed review policy. This is a DEMO policy, not approved clinical guidance.
Method GetReviewPolicy() As %String
{
    Set ver=$Get(^ClinicalEvidence.Policy("current"),"1.0")
    Quit $Get(^ClinicalEvidence.Policy(ver),"NO_POLICY")
}
}
