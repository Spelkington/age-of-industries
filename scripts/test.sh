# Declare Factorio executable root folder and configuration root folder
FACTORIO_BIN_ROOT=~/Games/factorio
FACTORIO_CONF_ROOT=~/Games/factorio

# Build project
sh ./scripts/build.sh

# Copy into Factorio Mods folder under working directory name
cp ./builds/* ${FACTORIO_CONF_ROOT}/mods/

# Begin logging to Factorio
mkdir logs
echo $PWD
${FACTORIO_BIN_ROOT}/bin/x64/factorio \
    --load-scenario "age-of-industries/age-of-industries" \
    --map-gen-settings "${PWD}/tests/test-map-settings.json" \
    --verbose \
| tee "${PWD}/logs/log_${EPOCHSECONDS}.log"