# Install
git checkout develop

brew install imagemagick

brew install node

cd src 
cd games-src
./install-press-kit.sh

cd ..
bundle update
bundle install

cd ..
./buildSite.sh
./generate-bundle.sh

# Running;/
./startJekyll.sh