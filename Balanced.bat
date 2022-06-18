cd C:\ProgramData\FlowX13BatchesV2

:: This is usually Balanced Plan but we don't have the default ones
call C:\Windows\System32\powercfg.exe -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

call C:\ProgramData\atrofac-cli.exe plan performance

:: This sets the AMD power slider to "Better performance"
call powercfg /setdcvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 002

:: This sets the AMD power slider to "Better performance"
call powercfg /setacvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 002

call .\PowerMode.exe BestPerformance

:: Turn on GPU
:: Turning on GPU doesn't seem to fail so it's OK not to restart
:: call as this command might mail
call powershell -command "Get-PnPDevice -FriendlyName 'NVIDIA GeForce RTX 3050 Ti Laptop GPU' | Enable-PnPDevice -Confirm:$false"

:: ryzenadj goes at the end because the other commands change these settings
call C:\ProgramData\ryzenadj-win64\ryzenadj.exe" --tctl-temp=85 --stapm-limit=16000 --stapm-time=360 --fast-limit=19000 --slow-limit=22000 --slow-time=20 --vrmmax-current=31152 --max-performance

call .\StopArmoury.bat

PAUSE