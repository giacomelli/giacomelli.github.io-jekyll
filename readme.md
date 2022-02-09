# Install
git checkout develop

brew install imagemagick

brew install node

cd src 
bundle update
bundle install

cd ..
./buildSite.sh
./generate-bundle.sh

# Running;/
./startJekyll.sh