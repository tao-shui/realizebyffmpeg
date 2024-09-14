@echo off
@chcp 65001 1>nul 2>nul
if not exist 1 (
md 1
) else ( 
echo 已存在文件夹"1"
echo 按任意键键覆盖并继续
pause
goto :A
)
:A
for %%i in (*.png *.jpg) do (ffmpeg -i %%i -filter_complex "[0:v]boxblur=luma_radius=2:luma_power=10,scale=800:800[ibg];[0:v]scale=600:600[vbg];[ibg][vbg]overlay=100:100" -y  1/%%~ni.jpg  )

pause
