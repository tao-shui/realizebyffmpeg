@chcp 65001
@echo off

if exist 1 (
goto A
) else (
goto x1
)

:A
echo 文件夹已存在,
echo 注意会覆盖文件，
echo 按任意键继续~！
pause
goto x2

:x1
md 1
set /p s=输入旋转角度：
for %%1 in (*.png *.jpg) do ffmpeg -i %%1 -vf "format=rgba,rotate=%s%*PI/180:ow=cos(%s%*PI/180)*iw+sin(%s%*PI/180)*ih:oh=sin(%s%*PI/180)*iw+cos(%s%*PI/180)*ih:c=none" -pix_fmt rgba -y "1/%%~n1.png"
echo 搞定~！按任意键退出！
pause
exit

:x2
set /p s=输入旋转角度：
for %%1 in (*.png *.jpg) do ffmpeg -i %%1 -vf "format=rgba,rotate=%s%*PI/180:ow=cos(%s%*PI/180)*iw+sin(%s%*PI/180)*ih:oh=sin(%s%*PI/180)*iw+cos(%s%*PI/180)*ih:c=none" -y "1/%%~n1.png"
echo 搞定~！按任意键退出！
pause
exit
