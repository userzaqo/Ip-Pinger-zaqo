@echo off
chcp 65001
mode 117,29
:ippinger
cls
title .                                                                                             + zaqo.sh + IP PINGER
echo.
echo.
echo                                                  [7;31m ╔═╗╦╔╗╔╔═╗╔═╗╦═╗ [0m
echo                                                  [7;31m ╠═╝║║║║║ ╦║╣ ╠╦╝ [0m  
echo                                                  [7;31m ╩  ╩╝╚╝╚═╝╚═╝╩╚═ [0m
echo.   
echo                                      [40;31m╔═════════════[ [40;37mIP PINGER [0m[40;31m]═════════════╗
echo                                      [40;31m║                                       [40;31m║
echo                                      [40;31m║         [0m[[31mTelegram[0m] [104m @zaqouser [0m[40;37m        [40;31m║                               
echo                                      [40;31m║        [40;37m [[31mDiscord[0m]  [7;31m zaqo#8207 [0m[40;37m        [40;31m║                     
echo                                      [40;31m║                                       [40;31m║
echo                                      [40;31m║[40;37m         Please [7;31mPROVIDE[0m The IP         [40;31m║
echo                                      [40;31m║                                       [40;31m║
echo                                      [40;31m╚═══════════════════════════════════════╝
echo.
set /p SPEED= [37m[root@[31mZAQO[37m] Requests speed : (1 = Fast / 2 = Default / 3 = Low): 
if %SPEED% == 1 goto next
if %SPEED% == 2 goto next
if %SPEED% == 3 goto next
if %SPEED% == nul goto bad
:bad
echo.
echo [37m[root@[31mINFO[37m] ERROR ! Choose a number between (1, 2, 3)
timeout /t 2 /nobreak > nul
goto ippinger
echo.
:next
set /p IP= [37m[root@[31mZAQO[37m] Please specify an IP : 
echo.
:ipping
PING -n %SPEED% %IP% | FIND "TTL=">nul
IF ERRORLEVEL 1 goto downed
IF NOT ERRORLEVEL 1 goto connected
:connected
echo [37m[root@[31mZAQO[37m] : [102m CONNECTED [0m to [[92m %IP% [0m] [[92m+[0m] Status : [102m ONLINE [0m BY ZAQO
echo.
goto ipping
:downed
echo [37m[root@[31mZAQO[37m] : [41m DOWNED [0m to [[31m %IP% [0m] [[31m-[0m] Status : [41m OFFLINE [0m BY ZAQO
echo.
goto ipping
