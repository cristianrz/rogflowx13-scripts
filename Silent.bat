cd C:\ProgramData\FlowX13BatchesV2

:: This is usually Power Saver Plan but we don't have the default ones,
:: corresponds to Silent
::C:\Windows\System32\powercfg.exe -setactive 0d88708c-b892-4f65-81f2-15b1f32a565a
call C:\Windows\System32\powercfg.exe -setactive 64a64f24-65b9-4b56-befd-5ec1eaced9b3

:: Fan silent profile
call :\ProgramData\atrofac-cli.exe plan silent

:: This sets the AMD power slider to "Better battery" on battery
call powercfg /setdcvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 001

:: This sets the AMD power slider to "Better battery" on AC
call powercfg /setacvalueindex scheme_current c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 001

:: Windows power mode
call C:\ProgramData\FlowX13BatchesV2\PowerMode.exe BetterPerformance

:: Restart GPU because it often gets bugged and pulls power even when disabled
call powershell -command "Get-PnPDevice -FriendlyName 'NVIDIA GeForce RTX 3050 Ti Laptop GPU' | Enable-PnPDevice -Confirm:$false"
call powershell -command "Get-PnPDevice -FriendlyName 'NVIDIA GeForce RTX 3050 Ti Laptop GPU' | Disable-PnPDevice -Confirm:$false"

:: Adjusts power and temperatures for the CPU
:: Tctl Temperature Limit = 65
:: Sustained Power Limit = 11W
:: STAPM constant time = 3 min
:: Actual power limit = 13W
:: Average power limit = 15W
:: Slow PPT constant time = 10 secs
:: VRM Maximum Current Limit = 21.24A
:: Power saving
::
:: Other command change these settings so this should run at the end
call C:\ProgramData\ryzenadj-win64\ryzenadj.exe --stapm-limit=11000 --fast-limit=13000 --slow-limit=15000 --stapm-time=180 --slow-time=10 --vrmmax-current=21240 --tctl-temp=65  --power-saving

call .\StopArmoury.bat

PAUSE