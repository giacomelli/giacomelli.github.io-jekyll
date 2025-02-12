echo press-kit build...
call npx presskit build --pretty-links 

echo Removing games folder...
rmdir /S /Q "../games"

echo Copying games folder
move build ../games