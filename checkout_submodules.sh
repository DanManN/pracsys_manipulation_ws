#!/usr/bin/env bash
git submodule init
git submodule update
I=1
for line in $(cat .gitmodules | grep -P '(path)|(branch)' | cut -f2 -d=)
do
	if [ $((I % 2)) -eq 0 ]
	then
		git checkout $line
		cd ..
	else
		cd $line
	fi
	I=$((I+1))
done
cd motoman
git submodule init
git submodule update
cd robotiq
git checkout noetic-devel
cd ../../pracsys_vbnpm
git submodule init
git submodule update
cd scripts/fusion
git checkout master
