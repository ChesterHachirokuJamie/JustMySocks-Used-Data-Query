function Encrypt-Script{
param(
[system.io.fileinfo]$File
)

if($File.Exists){
$fileContent = Get-Content $File -Raw
$bytes = [System.Text.Encoding]::Unicode.GetBytes($fileContent)
$encodedCommand = [Convert]::ToBase64String($bytes)
$batFile=$File.FullName+".bat"
"call $PSHOME\powershell.exe -encodedCommand `"$encodedCommand`""  | Out-File $batFile -Encoding ascii
Write-Host "加密的脚本已保存至 $batFile"
}
}
#Use Encrypt-Script X:\XXXX\XX.ps1 to Encrypt/Convert the file into .bat
