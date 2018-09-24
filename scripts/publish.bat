SETLOCAL

call rimraf .vuepress\dist
call build.bat
call rimraf ..\poly-coder-publish
call git clone https://github.com/poly-coder/poly-coder.github.io.git ..\poly-coder-publish
call rimraf ..\poly-coder-publish\*
call xcopy .vuepress\dist ..\poly-coder-publish /E /F /Y
call echo|set /p="Auto-published content from commit " > commitmsg.txt
call git show --format=%H --no-patch >> commitmsg.txt
call cd ..\poly-coder-publish
call git add -A
call git commit -F ..\poly-coder-vuepress\commitmsg.txt
call git push origin
call cd ..\poly-coder-vuepress
call rimraf commitmsg.txt

ENDLOCAL