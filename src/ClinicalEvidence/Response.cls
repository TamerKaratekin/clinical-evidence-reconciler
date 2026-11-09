Class ClinicalEvidence.Response Extends Ens.Response
{
Property CaseId As %String(MAXLEN = 40);
Property Disposition As %String(MAXLEN = 40);
Property Explanation As %String(MAXLEN = 4000);
Property PolicyVersion As %String(MAXLEN = 40);
Property UsedAI As %Boolean;
}
