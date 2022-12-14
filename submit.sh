#!/bin/sh 
### General options 
### -- specify queue -- 
BSUB -q hpc
### -- set the job Name -- 
BSUB -J btcv_ssl_swin_unetr
### -- ask for number of cores (default: 1) -- 
BSUB -n 4 
### -- specify that the cores must be on the same host -- 
BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot -- 
BSUB -R "rusage[mem=16GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
BSUB -M 64GB
### -- set walltime limit: hh:mm -- 
BSUB -W 08:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
BSUB -u fmager@dtu.dk
### -- send notification at start -- 
BSUB -B 
### -- send notification at completion -- 
BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o Output_%J.out 
#BSUB -e Output_%J.err 

# here follow the commands you want to execute with input.in as the input file
python3 colab_swin_unetr_btcv_segmentation_3d.py > output22_11_18.txt