# Build project
sh ./scripts/build.sh

# Copy into Factorio Mods folder under working directory name
cp ./builds/* ~/.factorio/mods/

# Begin logging to Factorio
mkdir logs
~/.local/share/Steam/steamapps/common/Factorio/bin/x64/factorio \
    --console-log logs/test_log_${EPOCHSECONDS}.txt