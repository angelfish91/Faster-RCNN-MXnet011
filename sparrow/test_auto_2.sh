#!/bin/bash

source activate mx011

export PYTHONUNBUFFERED=1

gpu=3
root_path=$(pwd)
log_dir=logs/train_test_vgg_uav
model_path=model/vgg-uav/e2e
network=vgg



if [ ! -d $log_dir ]; then
    mkdir $log_dir
fi

for epoch in $(seq 1 20)
do
	log_path=${root_path}/${log_dir}/$epoch.txt	
	echo ${log_path}
	python test.py --network $network --gpu $gpu --epoch $epoch --prefix $model_path > $log_path 2>&1
done 
