echo press-kit build...
call presskit build --pretty-links 

echo Removing games folder...
rm -fR ../games

echo Copying games folder
mv build ../games