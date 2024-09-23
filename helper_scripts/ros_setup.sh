#!/usr/bin/env bash
# repo + keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update

# Install
case "$(lsb_release -sr)" in
"18.04")
	sudo apt install -y ros-melodic-desktop-full
	;;
"16.04")
	sudo apt install -y ros-kinetic-desktop-full
	;;
"20.04")
	sudo apt install -y ros-noetic-desktop-full
	;;
esac

cat << EOF

Add the following to ~/.bashrc or ~/.zshrc to source ROS on login.

## source ros environment ##
if [[ -d /opt/ros ]]; then
	DIST="\$(ls -w 1 /opt/ros | head -n 1)"
	EXT="\$(ps -q $$ -o comm=)"
	[[ -f /opt/ros/\$DIST/setup.\$EXT ]] && source /opt/ros/\$DIST/setup.\$EXT
fi
EOF
