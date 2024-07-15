#!/bin/bash

# Update package lists
sudo apt update

# Install Java
sudo apt install -y openjdk-17-jre-headless

# Create minecraft directory
mkdir -p ~/minecraft-server
cd ~/minecraft-server

# Download and install Fabric
wget https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.4/fabric-installer-0.7.4.jar -O fabric-installer.jar
java -jar fabric-installer.jar server -mcversion 1.17.1 -downloadMinecraft

# Accept the EULA
echo "eula=true" > eula.txt

# Create mods directory
mkdir mods


# Example mod download with checksum verification (replace with actual mod URLs and checksums)
#mod_url="https://github.com/mtroope/minecraftserver/raw/main/fabric-api-0.87.2+1.19.4.jar"
#mod_checksum="A92650D48A9F672DC74E8B1EAEFEDB28DC83A13A80431215900181AA3A8675D8"
#wget $mod_url -O mods/fabric-api-0.87.2+1.19.4.jar

# Verify the checksum
#downloaded_checksum=$(sha256sum mods/fabric-api-0.87.2+1.19.4.jar | awk '{ print $1 }')
#if [ "$downloaded_checksum" != "$mod_checksum" ]; then
#    echo "Checksum verification failed for fabric-api-0.87.2+1.19.4.jar. Exiting."
#    exit 1
#fi

# Example mod download with checksum verification (replace with actual mod URLs and checksums)
#mod_url="https://github.com/mtroope/minecraftserver/raw/main/minecraftgpt-1.0.0.jar"
#mod_checksum="6DAFF17B53255B94E45A92D9516D5E27545FA1094499181F11EC58434B332E54"
#wget $mod_url -O mods/mod.jar

# Verify the checksum
#downloaded_checksum=$(sha256sum mods/minecraftgpt-1.0.0.jar | awk '{ print $1 }')
#if [ "$downloaded_checksum" != "$mod_checksum" ]; then
#    echo "Checksum verification failed for minecraftgpt-1.0.0.jar. Exiting."
#    exit 1
#fi

# Example mod download (replace with actual mod URLs)
#wget https://github.com/mtroope/minecraftserver/raw/main/fabric-api-0.87.2+1.19.4.jar -O mods/fabric-api-0.87.2+1.19.4.jar
#$wget https://github.com/mtroope/minecraftserver/raw/main/minecraftgpt-1.0.0.jar -O mods/minecraftgpt-1.0.0.jar


# Create a startup script
cat <<EOL > start.sh
#!/bin/bash
java -Xms2G -Xmx4G -jar fabric-server-launch.jar nogui
EOL

chmod +x start.sh

# Start the server
./start.sh
