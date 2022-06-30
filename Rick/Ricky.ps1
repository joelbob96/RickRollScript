$exists = Get-ScheduledTask | Where-Object {$_.TaskName -like "Rick"}

if($exists){
Unregister-ScheduledTask -TaskName "Rick"
}

$exists = Get-ScheduledTask | Where-Object {$_.TaskName -like "Focus"}

if($exists){
Unregister-ScheduledTask -TaskName "Focus"
}

$rickpath = "https://www.youtube.com/watch?v=xvFZjo5PgG0"

$ipath = "C:\Program Files (x86)\Internet Explorer\iexplore.exe"

$location = Get-Location
$spath = -join($location,"\Focus.ps1")

$spath

if(Test-Path -Path "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"){
$ipath = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
}elseif(Test-Path -Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"){
$ipath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
}elseif(Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"){
$ipath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
}

#$location = Get-Location
#$script = -join($location,"\Rick.ps1")

$action = (New-ScheduledTaskAction -Execute $ipath -Argument $rickpath)
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = New-ScheduledTaskPrincipal -UserId $env:username -RunLevel Highest
$setting = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $setting

Register-ScheduledTask 'Rick' -InputObject $task

$action2 = (New-ScheduledTaskAction -Execute powershell.exe -Argument $spath) 
$trigger2 = New-ScheduledTaskTrigger -AtLogon
$principal2 = New-ScheduledTaskPrincipal -UserId $env:username -RunLevel Highest
$setting2 = New-ScheduledTaskSettingsSet #-AsJob
$task2 = New-ScheduledTask -Action $action2 -Principal $principal2 -Trigger $trigger2 -Settings $setting2

Register-ScheduledTask 'Focus' -InputObject $task2

cmd /c 'pause'