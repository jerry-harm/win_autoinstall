rem 功能包括批量激活，安装qq，winrar，wechat，office
rem 请在目录下准备好安装包并命名好如qq.exe,winrar.exe，WeChatSetup.exe,7z.exe和officetoolplus文件夹

:: Change the working directory to current directory.
:: Make sure you have administrator permission.
echo 获取权限
set "Apply=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

echo 安装qq
start ./app/qq.exe /s /n /qn

echo 安装微信
rem 注意微信不能改名，否则不能静默安装
start ./app/WeChatSetup.exe /S

echo 安装7z
start ./app/7z.exe /S

echo 安装winrar
start ./app/winrar.exe /S

echo 安装office
start /wait './app/Office Tool/Office Tool Plus.Console.exe' deploy /add O365HomePremRetail_zh-cn  Access,Outlook,OneNote  /edition 64
echo 激活程序
"./app/Office Tool/Office Tool Plus.Console.exe" deploy /add O365HomePremRetail_zh-cn /edition 64
"./app/Office Tool/Office Tool Plus.Console.exe" ospp /sethst kms.loli.best
"./app/Office Tool/Office Tool Plus.Console.exe" ospp /act

echo 批量激活
slmgr.vbs /skms kms.loli.best
slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr.vbs /ato
slmgr.vbs /xpr
