# pracsys_manipulation_ws
An organized collection of ROS packages for planning and control of robot manipulators at PRACSYS lab.

## Setup the workspace
1. Clone the repository and all submodules and go into the repo directory:
```
mkdir project_ws
cd project_ws
git clone https://github.com/DanManN/pracsys_manipulation_ws.git src 
```
2. Checkout the submodules:
```
./checkout_submodules.sh
```
3. Go into the repo directory and install dependencies:
```
rosdep install --from-paths src --ignore-src -r -y
```
4. (Optional) Ignore unneccessary packages before building the workspace:
```
./ignore_pkgs_for_real.sh
```
5. Build docker containers for some submodules.
  - For gpd_ros:
```
cd src/gpd_ros
./build_container.sh
```
  - For segment3d (optional; only needed if you have a conda environment for [OVIR-3D](https://github.com/shiyoung77/OVIR-3D/) configured)
```
cd src/segment3d
./build_container.sh
```
6. Install pracsys_vbnpm requirements:
```
sudo apt install swig libeigen3-dev liborocos-kdl-dev libkdl-parser-dev liburdfdom-dev libnlopt-dev libgraphviz-dev libnlopt-cxx-dev
# install cuda: https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#ubuntu
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
cd src/pracsys_vbnpm
pip install -r requirements.txt
```
7. Build the workspace:
```
catkin build
```
