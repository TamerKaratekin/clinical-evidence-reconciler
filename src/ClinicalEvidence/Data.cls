Class ClinicalEvidence.Data Extends %RegisteredObject
{
ClassMethod Seed() As %Status
{
    // Synthetic examples only. These are NOT real patient records or a clinical validation set.
    Set ^ClinicalEvidence.Policy("current")="1.0"
    Set obj={"version":"1.0","workflow":"IBD referral evidence reconciliation","allowed_dispositions":["READY","NEEDS_INFO","REVIEW"],"guidance":"Assess evidence completeness and internal record consistency only. Do not diagnose IBD or recommend treatment. Missing infection testing may mean insufficient evidence. Inconclusive pathology is not automatically contradictory. If documents conflict, escalate for clinician review."}
    Set ^ClinicalEvidence.Policy("1.0")=obj.%ToJSON()

    Set obj={"id":"IBD-001","resourceType":"Bundle","type":"collection","synthetic":true,"evidence":[{"resource":"Condition/11","category":"symptom","finding":"six weeks diarrhea"},{"resource":"Observation/12","category":"calprotectin","finding":"elevated"},{"resource":"DiagnosticReport/13","category":"microbiology","finding":"not documented"},{"resource":"DiagnosticReport/14","category":"pathology","finding":"not documented"}],"expected":"NEEDS_INFO"}
    Set ^ClinicalEvidence.Case("IBD-001")=obj.%ToJSON()
    Set obj={"id":"IBD-002","resourceType":"Bundle","type":"collection","synthetic":true,"evidence":[{"resource":"Condition/21","category":"symptom","finding":"persistent diarrhea"},{"resource":"DiagnosticReport/22","category":"microbiology","finding":"infection screen documented"},{"resource":"DiagnosticReport/23","category":"endoscopy","finding":"signed report present"},{"resource":"DiagnosticReport/24","category":"pathology","finding":"signed report present"}],"expected":"READY"}
    Set ^ClinicalEvidence.Case("IBD-002")=obj.%ToJSON()
    Set obj={"id":"IBD-003","resourceType":"Bundle","type":"collection","synthetic":true,"evidence":[{"resource":"DiagnosticReport/31","category":"endoscopy","finding":"final signed report: segment X involved"},{"resource":"DiagnosticReport/32","category":"endoscopy","finding":"same procedure, conflicting final signed report: segment X not involved"},{"resource":"DiagnosticReport/33","category":"pathology","finding":"inconclusive"}],"expected":"REVIEW"}
    Set ^ClinicalEvidence.Case("IBD-003")=obj.%ToJSON()
    Quit 1
}
}
