# Run from PowerShell with `iris-aihub` already started and source copied into the container.
# Do not put OpenAI keys into this script or commit them to GitHub.
@(
  'Set sc=$SYSTEM.OBJ.LoadDir("/tmp/ClinicalEvidence","ck",.errs)'
  'Write "COMPILE: ",$SYSTEM.Status.GetErrorText(sc),!'
  'ZWRITE errs'
  'Do ##class(ClinicalEvidence.Data).Seed()'
  'Do ##class(ClinicalEvidence.Demo).Run("IBD-001")'
  'Do ##class(ClinicalEvidence.Demo).Run("IBD-002")'
  'Do ##class(ClinicalEvidence.Demo).Run("IBD-003")'
  'HALT'
) | docker exec -i iris-aihub iris session IRIS
