SETLOCAL

rimraf .vuepress\dist
build.bat
rimraf ..\poly-coder-publish
git clone https://github.com/poly-coder/poly-coder.github.io.git ..\poly-coder-publish
rimraf ..\poly-coder-publish\*
xcopy .vuepress\dist ..\poly-coder-publish /E /F /Y
echo|set /p="Auto-published content from commit " > commitmsg.txt
git show --format=%H --no-patch >> commitmsg.txt
cd ..\poly-coder-publish
git add -A
git commit -F ..\poly-coder-vuepress\commitmsg.txt
git push origin
cd ..\poly-coder-vuepress
rimraf commitmsg.txt

ENDLOCAL