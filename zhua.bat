:goop
netstat -ano | findstr 9002 | findstr "ESTABLISHED" | findstr /v "10.0.120">ru_10.0.0.12_9002_tmp.txt
for /f "tokens=3 delims= " %%a in (ru_10.0.0.12_9002_tmp.txt) do @echo %%a>>ru_10.0.0.12_9002_tmp.txt
type ru_10.0.0.12_9002_tmp.txt | findstr /v "10.0.0" | findstr /v "127.0.0.1">>ru_10.0.0.12_9002.txt

netstat -ano | findstr "ESTABLISHED" | findstr /v "10.0.120" |findstr /v "10.0.0.12:9002"|findstr /v "10.0.0.12:9003"|findstr /v "10.0.0.12:9004"|findstr /v "10.0.0.12:9201"|findstr /v "10.0.0.12:9202"|findstr /v "10.0.0.12:9000"|findstr /v "10.0.0.12:9901"|findstr /v "10.0.0.12:9902"|findstr /v "10.0.0.12:19912"|findstr /v "10.0.0.12:19528">chu_tmp.txt
for /f "tokens=3 delims= " %%a in (chu_tmp.txt) do @echo %%a>>chu_tmp.txt
type chu_tmp.txt | findstr /v "10.0.0" | findstr /v "127.0.0.1">>chu_10.0.0.12.txt
ping -n 2 10.0.0.1
goto goop