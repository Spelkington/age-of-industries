# Build project
sh ./scripts/build.sh

# Copy into Factorio Mods folder under working directory name
cp ./builds/* ~/Games/factorio/mods/

# Begin logging to Factorio
mkdir logs
echo $PWD
~/Games/factorio/bin/x64/factorio \
    --load-scenario "age-of-industries/age-of-industries" \
    --map-gen-settings "${PWD}/tests/test-map-settings.json" \
    --verbose \
| tee "${PWD}/logs/log_${EPOCHSECONDS}.log"