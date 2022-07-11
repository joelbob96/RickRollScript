PowerShell.exe -WindowStyle Hidden{

$app = "Internet Explorer"

if(Test-Path -Path "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"){
$app = "Brave"
}elseif(Test-Path -Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"){
$app = "Google Chrome"
}elseif(Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"){
$app = "Microsoft Edge"
}

$app

#$processes = get-process $app | select -expand id

#$process = $processes[3]

$key = New-Object -ComObject wscript.shell

Start-Sleep -Seconds 3

$key.AppActivate($app)

#$key.AppActivate($process)

$key.SendKeys("{F11}")
Start-Sleep -Seconds 1
$key.SendKeys("f")
}