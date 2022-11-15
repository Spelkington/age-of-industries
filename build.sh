# TODO: This is a first rough draft of an automated deploy
# script, and should probably be streamlined later.

# Build into /dist
echo "Building dist..."
npx tstl

# Copy all of src into dist in order to capture non-TS files
echo "Moving all config files into dist..."
cp -R src/* dist/

# Remove all ts files from dist
find ./dist -name "*.ts" -type f -delete

# Generate info.json file from project package.json
python scripts/build_mod_description.py \
    -p package.json \
    -o dist/info.json

# Zip dist into zip file
zip build dist/*

# Copy into Factorio Mods folder under working directory name
BUILDNAME=${PWD##*/}          # to assign to a variable
BUILDNAME=${BUILDNAME:-/}        # to correct for the case where PWD=/
VERSION=`cat version.txt`
mv build.zip ~/.factorio/mods/${BUILDNAME}_${VERSION}.zip

# Run Factorio with mod
# ~/.local/share/Steam/steamapps/common/Factorio/bin/x64/factorio

# Clean up
rm ./version.txt