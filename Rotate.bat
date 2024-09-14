@chcp 65001 1>nul 2>nul
@echo off

if not exist 1 (
md 1
) else (
echo 已存在文件夹"1"
echo 按任意键键覆盖并继续
pause
goto x1
)

:x1
set /p s=输入旋转角度：
for %%1 in (*.png *.jpg) do ffmpeg -i "%%1" -vf "format=rgba,rotate=%s%*PI/180:ow=cos(%s%*PI/180)*iw+sin(%s%*PI/180)*ih:oh=sin(%s%*PI/180)*iw+cos(%s%*PI/180)*ih:c=none" -pix_fmt rgba -y "1/%%~n1.png"
echo 搞定~！按任意键退出！
pause
exit


