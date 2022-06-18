cd C:\ProgramData\FlowX13BatchesV2

:: Usually this is the performance power plan but we don't have the default
:: C:\Windows\System32\powercfg.exe -setactive 27fa6203-3987-4dcc-918d-748559d549ec
call C:\Windows\System32\powercfg.exe -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

call C:\ProgramData\atrofac-cli.exe plan turbo

:: This sets the AMD power slider to "Best performance"
call powercfg /setdcvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 003

:: This sets the AMD power slider to "Best performance"
call powercfg /setacvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 003

call .\PowerMode.exe BestPerformance

:: Turn on GPU
:: Turning on GPU doesn't seem to fail so it's OK not to restart
call powershell -command "Get-PnPDevice -FriendlyName 'NVIDIA GeForce RTX 3050 Ti Laptop GPU' | Enable-PnPDevice -Confirm:$false"

call C:\ProgramData\ryzenadj-win64\ryzenadj.exe --tctl-temp=95 --stapm-limit=25000 --stapm-time=800 --fast-limit=30000 --slow-limit=35000 --slow-time=35 --vrmmax-current=50000 --max-performance

call .\StopArmoury.bat

PAUSE