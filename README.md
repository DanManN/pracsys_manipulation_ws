# pracsys_manipulation_ws
An organized collection of ROS packages for planning and control of robot manipulators at PRACSYS lab.

## Setup the workspace
1. Clone the repository and all submodules and go into the repo directory:
```
git clone --recursive https://github.com/DanManN/pracsys_manipulation_ws.git
cd pracsys_manipulation_ws
```
2. Go into the repo directory and install dependencies:
```
rosdep install --from-paths src --ignore-src -r -y
```
3. (Optional) Ignore unneccessary packages before building the workspace:
```
cd src/motoman
./ignore_pkgs.sh
```
4. Build docker containers for some submodules.
  - For gpd_ros:
```
cd src/gpd_ros
./build_container.sh
```
  - For segment3d (optional if you have a conda environment for [OVIR-3D](https://github.com/shiyoung77/OVIR-3D/) configured)
```
cd src/segment3d
./build_container.sh
```

5. Install pip requirements for pracsys:
```
cd src/pracsys_vbnpm
pip install -r requirements.txt
```

6. Build the workspace:
```
catkin build
```
