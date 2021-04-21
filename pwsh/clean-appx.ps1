$whitelist = @(
  "9E2F88E3.Twitter",
  "89006A2E.AutodeskSketchBook",
  "PandoraMediaInc.29680B314EFC2",
  "4DF9E0F8.Netflix",
  "6918E89D.TheOthello",
  "OutOfTheBitLtd.FourInARow2014",
  "SpotifyAB.SpotifyMusic",
  "DellPrinter.DellDocumentHub",
  "D50536CD.CitrixReceiver"
)

Get-AppxPackage -AllUsers | Where-Object {
  !$_.Publisher.contains('O=Microsoft Corporation,') -and !$whitelist.Contains($_.name)
} | Remove-AppxPackage -AllUsers