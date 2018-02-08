### Instructions to install ECLIPSE IDE

Instructions to install ECLIPSE IDE for development with ROS (Robotics Operating System).

1. Move the package to /opt/ folder.

# sudo mv eclipse-SDK-4.2.1-linux-gtk.tar.gz /opt/

2. Use the command line to extract the tar.gz package.

# cd /opt/
# sudo tar xzvf eclipse-SDK-4.2.1-linux-gtk.tar.gz

3.Create a desktop file and place it into /usr/share/applications

# sudo gedit /usr/share/applications/eclipse.desktop

Copy the following to the eclipse.desktop file

[Desktop Entry]
Name=Eclipse.ros
Type=Application
Exec=bash -i -c "/opt/eclipse/eclipse"
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=eclipse.ros
