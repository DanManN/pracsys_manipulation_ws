for pkg in $(echo "
	aruco_ros
	easy_handeye
	realsense-ros
	")
do
	echo "Ignoring: $pkg"
	touch $pkg/CATKIN_IGNORE
done
