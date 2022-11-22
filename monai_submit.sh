#!/bin/sh
### General options
### –- specify queue --
#BSUB -q gpuv100
### -- set the job Name --
#BSUB -J testjob
### -- ask for number of cores (default: 1) --
#BSUB -n 2
### -- Select the resources: 1 gpu in exclusive process mode --
#BSUB -gpu "num=2:mode=exclusive_process"
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- set walltime limit: hh:mm --  maximum 24 hours for GPU-queues right now
#BSUB -W 08:00
# request 5GB of system-memory
#BSUB -R "rusage[mem=64GB]"
### -- set the email address --
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
##BSUB -u fmager@dtu.dk
### -- send notification at start --
#BSUB -B
### -- send notification at completion--
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -oo gpu_%J.out
#BSUB -eo gpu_%J.err
# -- end of LSF options --

nvidia-smi


# here follow the commands you want to execute with input.in as the input file
module load python3/3.9.11
source /zhome/1d/3/140899/monai_v1/bin/activate
python3 colab_swin_unetr_btcv_segmentation_3d.py > output22_11_18.txt