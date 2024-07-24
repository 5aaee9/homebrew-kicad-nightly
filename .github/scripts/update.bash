#!/usr/bin/env bash

set -ex

curl \
    -SL 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=osx/nightly/' \
    -o nightly.xml

cat nightly.xml | xpath -q -e '//ListBucketResult//Contents[last()]' > last_nightly.xml

# Read latest version
FILE_NAME=$(cat last_nightly.xml | xpath -q -e '//Key/text()')
export VERSION=$(echo $FILE_NAME | awk -F '-' '{print $3"-"$4"-"$5"-"$6}' | awk -F '.' '{print $1}')

OLD_VERSION=$(cat nightly.version)

rm -f last_nightly.xml
rm -f nightly.xml

if [ "$VERSION" == "$OLD_VERSION" ]; then
    echo "Remote same version, $VERSION exit"
    exit 0
fi

# Download latest release and calcuate hash of dmg file
curl \
    -SL https://downloads.kicad.org/kicad/macos/explore/nightlies/download/kicad-unified-$VERSION.dmg \
    -o kicad.dmg

export HASH=$(sha256sum kicad.dmg | awk '{print $1}')

echo $VERSION > nightly.version

envsubst < .github/data/kicad.template > Casks/kicad-nightly.rb

# Cleanup
rm -f kicad.dmg

# Push changes
git add nightly.version
git add Casks

git commit -m "kicad: $OLD_VERSION -> $VERSION"
git push origin master