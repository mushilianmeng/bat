set remotesship=anso_x1.ansosz.com
set remoteshport=16122

if "%4"=="ssh_link" (
call:ssh_link %1 %2 %3
) else if "%4"=="ssh_link_jk" (
call:ssh_link_jk %1 %2 %3
) else if "%4"=="ssh_link_start" (
start ssh_link.bat %1 %2 %3 ssh_link_jk
start ssh_link.bat %1 %2 %3 ssh_link
) else (
start ssh_link.bat 1052 172.31.225.74 10050 ssh_link_start
start ssh_link.bat 1053 172.31.0.103 10050 ssh_link_start
start ssh_link.bat 1054 172.31.225.75 10050 ssh_link_start
start ssh_link.bat 1055 172.31.0.104 10050 ssh_link_start
start ssh_link.bat 1056 172.31.0.105 10050 ssh_link_start
start ssh_link.bat 1057 172.31.225.71 10050 ssh_link_start
start ssh_link.bat 1058 172.31.225.70 10050 ssh_link_start
start ssh_link.bat 1061 172.31.225.71 22 ssh_link_start
start ssh_link.bat 1062 172.31.225.70 22 ssh_link_start
)
EXIT /B 0



:ssh_link
:loop
ssh -i C:\Users\Administrator\.ssh\id_rsa -o ServerAliveInterval=30 -CnNT -R %1:%2:%3 root@%remotesship% -p %remoteshport%
goto loop
goto :EOF

:ssh_link_jk
:aloop
ssh -i C:\Users\Administrator\.ssh\id_rsa -p %remoteshport% root@%remotesship% "netstat -antp | grep 0.0.0.0:%1"
if %ERRORLEVEL%==0 (
ping -n 170 127.0.0.1
goto aloop
) else if %ERRORLEVEL%==1 (
taskkill /F /IM ssh.exe
goto aloop
) else (
ping -n 2 127.0.0.1
goto aloop
)
