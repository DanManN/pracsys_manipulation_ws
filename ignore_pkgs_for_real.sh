for pkg in $(echo "
	aruco_ros
	easy_handeye
	realsense-ros
	tuw_marker_detection
	")
do
	echo "Ignoring: $pkg"
	touch $pkg/CATKIN_IGNORE
done
cd motoman
./ignore_pkgs.sh
echo "Ignoring: motoman_driver"
touch motoman_driver/CATKIN_IGNORE
