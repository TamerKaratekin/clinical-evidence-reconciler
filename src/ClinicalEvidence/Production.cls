Class ClinicalEvidence.Production Extends Ens.Production
{
XData ProductionDefinition
{
<Production Name="ClinicalEvidence.Production" LogGeneralTraceEvents="true">
  <Item Name="ClinicalEvidence.Ingest" ClassName="ClinicalEvidence.Ingest" PoolSize="1" Enabled="true" Foreground="false" />
  <Item Name="ClinicalEvidence.Process" ClassName="ClinicalEvidence.Process" PoolSize="1" Enabled="true" Foreground="false" />
  <Item Name="ClinicalEvidence.AI" ClassName="ClinicalEvidence.AIOperation" PoolSize="1" Enabled="true" Foreground="false" />
</Production>
}
}
