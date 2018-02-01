#!/bin/bash

source activate mx011

export PYTHONUNBUFFERED=1

gpu=3
root_path=$(pwd)
log_dir=logs/train_test_res_uav
model_path=model/resnet-uav/e2e
network=resnet



if [ ! -d $log_dir ]; then
    mkdir $log_dir
fi

for epoch in $(seq 10 20)
do
	log_path=${root_path}/${log_dir}/$epoch.txt	
	echo ${log_path}
	python test.py --network $network --gpu $gpu --epoch $epoch --prefix $model_path > $log_path 2>&1
done 
