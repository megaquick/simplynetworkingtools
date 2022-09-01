@ECHO OFF
TITLE DORTMANS BROS NETWORKING TOOL
GOTO Beginning

:Beginning
CLS
ECHO Please enter an option from below:
ECHO 1.GetPortInfo
ECHO 2.Get IP and MAC addresses
ECHO 3.Local Network info in total
ECHO 4.Show saved wifi netowrks
ECHO 5.Show saved network passwords
ECHO 6.Exit
ECHO.

CHOICE /C 123456 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF %ERRORLEVEL% == 1 GOTO GetPortInfo
IF %ERRORLEVEL% == 2 GOTO GetIPList
IF %ERRORLEVEL% == 3 GOTO IPCONFIG
IF %ERRORLEVEL% == 4 GOTO WifiHistory
IF %ERRORLEVEL% == 5 GOTO WifiPasswords
IF %ERRORLEVEL% == 6 GOTO End

:GetPortInfo
ECHO GetPortInfo 
netstat -a
PAUSE
GOTO Beginning

:GetIPList
ECHO GetIPList 
arp -a
PAUSE
GOTO Beginning

:IPCONFIG
ECHO IPCONFIG 
ipconfig /all
PAUSE
GOTO Beginning

:WifiHistory
ECHO WifiHistory 
netsh wlan show profile
PAUSE
GOTO Beginning

:WifiPasswords
ECHO What network do you want the password for?
ECHO.

ECHO Enter the network name : 
set /p NETWORKNAME=

netsh wlan show profile name="%NETWORKNAME%" key=clear

PAUSE
GOTO Beginning

:End