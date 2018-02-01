#!/bin/bash

gpu_id=1
model_path=model/resnet-uav/e2e
log_path=logs/train_log/resnet_uav.log

network=resnet
pretrained=model/resnet-101

source activate mx011

echo -e '=============\n trainning\n============='

echo $model_path
echo $log_path

python train_end2end_uav.py --gpus $gpu_id --prefix $model_path \
					    --end_epoch 20 --lr_step 7 > $log_path 2>&1 \
                 --network $network --pretrained $pretrained
