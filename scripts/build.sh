# TODO: This is a first rough draft of an automated deploy
# script, and should probably be streamlined later.

# Clean out /dist
rm -rf ./dist/*

# Build into /dist
echo "Building dist..."
npx tstl

# Copy all of src into dist in order to capture non-TS files
echo "Moving all config files into dist..."
cp -R src/* dist/

# Remove all ts files from dist
find ./dist -name "*.ts*" -type f -delete

# Generate info.json file from project package.json
python scripts/build_mod_description.py \
    -p package.json \
    -o dist/info.json

# Zip dist into zip file
BUILDNAME=${PWD##*/}        # to assign to a variable
BUILDNAME=${BUILDNAME:-/}   # to correct for the case where PWD=/
VERSION=`cat version.txt`
FULLNAME=${BUILDNAME}_${VERSION}
zip -r ${FULLNAME}.zip dist/*

# Copy into builds dir
mkdir builds
mv ${FULLNAME}.zip ./builds

# Clean up
rm ./version.txt