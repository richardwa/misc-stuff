$body = @"
<?xml version="1.0" encoding="utf-8"?>
<CMSearchDescription>
<searchID>anythinghere</searchID>
<trackList>
  <trackID>101</trackID>
</trackList>
<timeSpanList>
  <timeSpan>
    <startTime>2016-11-20T00:00:00Z</startTime>
    <endTime>2016-11-20T23:59:59Z</endTime>
  </timeSpan>
</timeSpanList>
<maxResults>40</maxResults>
<searchResultPostion>40</searchResultPostion>
<metadataList>
  <metadataDescriptor>//metadata.psia.org/VideoMotion</metadataDescriptor>
</metadataList>
</CMSearchDescription>
"@

$pw = [IO.File]::ReadAllText("$PSScriptRoot\admin.pw")
Invoke-RestMethod -Verbose -Uri "http://admin:$pw@192.168.1.21//ISAPI/ContentMgmt/search" `
  -Method "POST" -Body $body

Invoke-RestMethod "http://admin:$pw@192.168.1.21/ISAPI/Event/notification/alertStream"
