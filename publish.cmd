@echo PUBLISHING

@echo CLONING THE REPOSITORY...
@cd src
@rmdir /S /Q _site
@git clone https://github.com/giacomelli/giacomelli.github.io.git _site

@echo GENERTING BUNDLE...
@mkdir _site 
@mkdir _site\libs
@echo "" > _site\libs\style.css
call bundle exec jekyll build --future --limit_posts 1

@echo BUILDING jekyll...
@call bundle exec jekyll build

@echo COPYING EXTRA FILES...
@xcopy apps/unitytips-museum/_content _site/apps/unitytips-museum/_content /E /I /Y
@xcopy apps\unitytips-museum\_content _site\apps\unitytips-museum\_content /E /I /Y
@xcopy apps\unitytips-museum\_framework _site\apps\unitytips-museum\_framework /E /I /Y

@xcopy apps\geneticsharp-runner-blazorapp\_content _site\apps\geneticsharp-runner-blazorapp\_content /E /I /Y
@xcopy apps\geneticsharp-runner-blazorapp\_framework _site\apps\geneticsharp-runner-blazorapp\_framework /E /I /Y

@xcopy apps\arc-8\_content _site\apps\arc-8\_content /E /I /Y
@xcopy apps\arc-8\_framework _site\apps\arc-8\_framework /E /I /Y

@xcopy games-src\puzzimals\demo _site\games\puzzimals\demo /E /I /Y
@xcopy tools\meu-navegador _site\tools\my-browser /E /I /Y

@copy games-src\index-replacement.html _site\games\index.html
@copy games-src\nibble\play.html _site\games\nibble\play.html
@copy games-src\nibble\NIBBLE.zip _site\games\nibble\NIBBLE.zip

@copy games-src\puzzlord\privacy-policy.html _site\games\puzzlord\privacy-policy.html
@copy games-src\puzzimals\privacy-policy.html _site\games\puzzimals\privacy-policy.html
 
@copy ..\CNAME _site\CNAME
@echo ".nojekyll" > _site\.nojekyll

@echo GENERATING VERSION.JSON...
@cd _site
@echo off
for /f "delims=" %%a in ('powershell -Command "Get-Date -Format g"') do set DATE=%%a
@echo { "date": "%DATE%", "branch": "" } > version.json


@echo COMMITING AND PUSHING...
@git add .
@git commit -m "Site update"
@git push

@echo DONE.