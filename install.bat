rem ���ܰ������������װqq��winrar��wechat��office
rem ����Ŀ¼��׼���ð�װ������������qq.exe,winrar.exe��WeChatSetup.exe,7z.exe��officetoolplus�ļ���

:: Change the working directory to current directory.
:: Make sure you have administrator permission.
echo ��ȡȨ��
set "Apply=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

echo ��װqq
start /wait .\app\qq.exe /s /n /qn

echo ��װ΢��
rem ע��΢�Ų��ܸ����������ܾ�Ĭ��װ
start /wait .\app\WeChatSetup.exe /S

rem echo ��װ7z
rem start /wait .\app\7z.exe /S

echo ��װwinrar
start /wait .\app\winrar.exe /S

echo ��װoffice
start /wait ".\app\Office Tool\Office Tool Plus.Console.exe" deploy /add O365HomePremRetail_zh-cn /edition 64
echo �������
".\app\Office Tool\Office Tool Plus.Console.exe" ospp /inslicid ProPlus2021Volume
".\app\Office Tool\Office Tool Plus.Console.exe" ospp /sethst kms.loli.best
".\app\Office Tool\Office Tool Plus.Console.exe" ospp /act

echo ��������
rem ���ֻ֧��רҵ����������
slmgr.vbs /skms kms.loli.best
slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr.vbs /ato
slmgr.vbs /xpr
