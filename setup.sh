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

# Example mod download (replace with actual mod URLs)
wget https://github.com/mtroope/minecraftserver/tree/main/mods/mod.jar -O mods/mod.jar

# Create a startup script
cat <<EOL > start.sh
#!/bin/bash
java -Xms2G -Xmx4G -jar fabric-server-launch.jar nogui
EOL

chmod +x start.sh

# Start the server
./start.sh
