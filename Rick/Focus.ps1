PowerShell.exe -WindowStyle Hidden{

$app = "iexplore"

if(Test-Path -Path "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"){
$ipath = "brave"
}elseif(Test-Path -Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"){
$app = "chrome"
}elseif(Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"){
$app = "msedge"
}

$app

$processes = get-process $app | select -expand id

#$process = $processes[3]

$key = New-Object -ComObject wscript.shell

Start-Sleep -Seconds 3

foreach($p in $processes){
$key.AppActivate($p)
}
#$key.AppActivate($process)

$key.SendKeys("{F11}")
Start-Sleep -Seconds 1
$key.SendKeys("f")
}