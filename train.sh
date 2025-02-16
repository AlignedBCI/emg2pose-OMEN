#!/bin/bash -l
#SBATCH -t 48:00:00                  
#SBATCH -N 2                         
#SBATCH --ntasks-per-node=4                    
#SBATCH --cpus-per-task=8      
#SBATCH -J emg2pose_omen   
#SBATCH --mem=150GB                   
#SBATCH -o emg2pose_omen_%j.log
#SBATCH -e emg2pose_omen_%j.err
#SBATCH --gpus-per-node=4


cd /om2/user/claudif/DecodingAlgorithms/emg2pose-OMEN

source /om2/user/claudif/myenv/bin/activate

conda deactivate

srun python run.py
